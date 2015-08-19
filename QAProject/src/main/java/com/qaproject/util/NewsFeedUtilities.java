package com.qaproject.util;

import com.qaproject.dao.*;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.*;
import org.joda.time.DateTime;
import org.joda.time.Hours;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Minh on 6/14/2015.
 */
@Component
public class NewsFeedUtilities {
    @Autowired
    UserDao userDao;
    @Autowired
    PostDao postDao;
    @Autowired
    WantAnswerDao wantAnswerDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    TagUserDao tagUserDao;
    @Autowired
    TagPostDao tagPostDao;
    @Autowired
    TagMaterialDao tagMaterialDao;

    private final String QUESTION = "QTN_";
    private final String QUESTION_IN_CLASS = "QIC_";
    private final String QUESTION_IN_FOLLOW = "QIF_";
    private final String QUESTION_IN_KNOW ="QIK_";
    private final String ARTICLE = "ATC_";
    private final String MATERIAL = "MTR_";
    private final Integer STUDENT = 1;
    private final Integer TEACHER = 2;
    private final Integer ACCEPTED = 1;
/*    private final String SERVER = "23.227.163.94";*/
    private final String SERVER = "localhost";

    public void setNewsFeed() {
        List<User> users = userDao.findAll();
        if (users == null) {
            return;
        }
        Jedis jedis = new Jedis(SERVER);
        for (User user : users) {
            setQuestionsInClass(user, jedis);
            setQuestionsInFollower(user, jedis);
            setQuestionsInKnow(user, jedis);
            setArticlesInTags(user,jedis);
            setArticlesInKnow(user,jedis);
            setMaterialInTags(user,jedis);
            setMaterialInKnow(user,jedis);
        }
    }

    public void setNewsFeedQuestionAfterRegister(User user) {
        Jedis jedis = new Jedis(SERVER);
        setQuestionsInKnow(user,jedis);
        setArticlesInKnow(user,jedis);
        setMaterialInKnow(user,jedis);
    }

    public void setNewsFeedQuestionAfterCreatePost(Post question){
        List<User> users = userDao.findAll();
        if (users==null) {
            return;
        }
        Jedis jedis = new Jedis(SERVER);
        for (User user: users){
            //setQuestionInClass(user,jedis,question);
            //setQuestionsInFollower(user,jedis,question);
            //setQuestionsInKnow(user,jedis,question);
        }
    }

    public List<PostDto> loadNewsFeedQuestions(Integer userId, Integer page){
        if (page<1){
            page = 1;
        }
        Integer from = Constant.NUMBER_PAGE*(page -1);
        Integer to = Constant.NUMBER_PAGE*page +1 ;
        List<Post> questions = getQuestionsFromRedis(userId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions != null) {
            if (to>questions.size()) {
                to = questions.size();
            }
            List<Post> subQuestion = questions.subList(from,to);
            for(Post question: subQuestion) {
                Integer answerCount = 0;
                if (question!=null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if (answers!=null) {
                        answerCount = answers.size();
                    }
                }
                PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,answerCount);
                questionDtos.add(questionDto);
            }
        }
        return questionDtos;
    }

    public List<PostDto> loadNewsFeedArticles(Integer userId, Integer nextFrom) {
        List<Post> articles = getArticlesFromRedis(userId);
        if (nextFrom<0) {
            nextFrom = 0;
        }
        Integer from = nextFrom;
        Integer to = nextFrom+(Constant.NUMBER_PAGE+1);
        List<PostDto> articlesDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            if (to>articles.size()) {
                to=articles.size();
            }
            List<Post> subArticles = articles.subList(from,to);
            for(Post article: subArticles) {
                Integer answerCount = 0;
                if (article!=null) {
                    List<Post> answers = postDao.findRepliesByParentId(article.getId());
                    if (answers!=null) {
                        answerCount = answers.size();
                    }
                }
                PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,answerCount);
                articlesDtos.add(articleDto);
            }
        }
        return  articlesDtos;
    }

    public List<MaterialDto> loadNewsFeedMaterials(Integer userId, Integer nextFrom) {
        List<Material> materials = getMaterialsFromRedis(userId);
        if (nextFrom<0) {
            nextFrom = 0;
        }
        Integer from = nextFrom;
        Integer to = nextFrom+(Constant.NUMBER_PAGE+1);
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        if (materials!=null) {
            if (to>materials.size()) {
                to=materials.size();
            }
            List<Material> subMaterials = materials.subList(from,to);
            for(Material material: subMaterials) {
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                materialDtos.add(materialDto);
            }
        }
        return  materialDtos;
    }

    public void removeQuestionsOfClassroom(Integer userId, Integer classroomId){
        if (classroomId!=null) {
            Classroom ownerClassroom = classroomDao.find(classroomId);
            if (ownerClassroom!=null){
                List<Post> questionsInClassroom = postDao.findQuestionByOwnerClassroom(ownerClassroom);
                Jedis jedis= new Jedis(SERVER);
                for (Post question: questionsInClassroom){
                    jedis.zrem(QUESTION_IN_CLASS+ userId, Integer.toString(question.getId()));
                }
            }

        }
    }

    public void removeQuestionsOfFollowedTeacher(Integer userId, Integer teacherId){
        if (teacherId!=null) {
            User teacher = userDao.find(teacherId);
            if (teacher!=null){
                List<Post> questionsInFollowedTeacher = postDao.findQuestionsByOwnerUser(teacher);
                Jedis jedis= new Jedis(SERVER);
                for (Post question: questionsInFollowedTeacher){
                    jedis.zrem(QUESTION_IN_FOLLOW+ userId, Integer.toString(question.getId()));
                }
            }

        }
    }

    /*set user news feed question in their class for all question*/
    private void setQuestionsInClass(User user, Jedis jedis) {
        List<Classroom> classrooms = new ArrayList<Classroom>();
        if (user.getRoleId().getId()==TEACHER){
            classrooms = classroomDao.findByOwnerUser(user.getId());
        }
        if (user.getRoleId().getId()==STUDENT){
            List<ClassroomUser> classroomUsers = classroomUserDao.findByUserWithApproved(user);
            if (classroomUsers==null) {
                return;
            }
            for (ClassroomUser classroomUser:classroomUsers) {
                classrooms.add(classroomUser.getClassroomId());
            }
        }
        if (classrooms == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                jedis.zrem(QUESTION_IN_KNOW + user.getId(),Integer.toString(question.getId()));
                jedis.zrem(QUESTION_IN_FOLLOW + user.getId(),Integer.toString(question.getId()));
                jedis.zadd(QUESTION_IN_CLASS + user.getId(),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }

    /*set user news feed question in their class for specific question*/
    /*private void setQuestionInClass(User user, Jedis jedis, Post question){
        boolean isSet = false;
        Classroom classroomOfQuestion = question.getOwnerClassId();
        if (user.getRoleId().getId()==TEACHER) {
            List<Classroom> classroomsOfOwner = classroomDao.findByOwnerUser(user.getId());
            if (classroomsOfOwner==null) {
                return;
            }
            if (classroomsOfOwner.contains(classroomOfQuestion)) {
                isSet = true;
            }

        }
        if (user.getRoleId().getId()==STUDENT) {
            List<ClassroomUser> classroomUsers = classroomUserDao.findByUserWithApproved(user);
            if (classroomUsers==null) {
                return;
            }
            for (ClassroomUser classroomUser:classroomUsers) {
                if (classroomUser.getClassroomId().equals(classroomOfQuestion)){
                    isSet = true;
                    break;
                }
            }
        }
        if (isSet){
            try {
                jedis.zadd(QUESTION_IN_CLASS + user.getId(),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }*/

    /*set user news feed question in their follower for all question*/
    private void setQuestionsInFollower(User user, Jedis jedis) {
        List<Follower> followedTeachers = followerDao.findByFollower(user);
        if (followedTeachers == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Follower followedTeacher : followedTeachers) {
            if (followedTeacher == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionsByOwnerUser(followedTeacher.getTeacherId());
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                // if question did not already exist in Redis DB
                if (jedis.zrank(QUESTION_IN_CLASS + user.getId(),Integer.toString(question.getId()))==null) {
                    jedis.zrem(QUESTION_IN_KNOW + user.getId(), Integer.toString(question.getId()));
                    jedis.zadd(QUESTION_IN_FOLLOW + user.getId(),
                            calculateScore(user, question), Integer.toString(question.getId()));
                }
            } catch (Exception e){

            }
        }
    }

    /*set user news feed question in their follower for specific question*/
    /*private void setQuestionsInFollower(User user, Jedis jedis, Post question){
        List<Follower> followedTeachers = followerDao.findByFollower(user);
        List<User> teachers = new ArrayList<User>();
        User teacherOfQuestion  = question.getOwnerUserId();
        boolean isSet = false;
        if (followedTeachers == null) {
            return;
        }
        for (Follower followedTeacher : followedTeachers) {
            if (followedTeacher == null) {
                continue;
            }
            teachers.add(followedTeacher.getTeacherId());
        }
        if (teachers.contains(teachers)) {
            isSet = true;
        }
        if (isSet) {
            try {
                jedis.zadd(QUESTION_IN_FOLLOWER + user.getId(),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e){

            }
        }
    }*/

    /*set user's news feed questions in their knowledge for all question*/
    private void setQuestionsInKnow(User user, Jedis jedis) {
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        if (classrooms == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                // if question did not already exist in Redis DB
                if (jedis.zrank(QUESTION_IN_FOLLOW + user.getId(),Integer.toString(question.getId()))==null
                        && jedis.zrank(QUESTION_IN_CLASS + user.getId(),Integer.toString(question.getId()))==null) {
                    jedis.zadd(QUESTION_IN_KNOW + user.getId(),
                            calculateScore(user, question), Integer.toString(question.getId()));
                }
            } catch (Exception e) {

            }
        }
    }

    /*set user's news feed questions in their knowledge for specific question*/
    /*private void setQuestionsInKnow(User user, Jedis jedis, Post question){
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        Classroom classroomOfQuestion = question.getOwnerClassId();
        boolean isSet = false;
        if (classrooms == null) {
            return;
        }
        if (classrooms.contains(classroomOfQuestion)) {
            isSet = true;
        }
        if (isSet) {
            try {
                jedis.zadd(QUESTION_IN_KNOW + user.getId()
                        , calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }*/

    /*set user's news feed articles in their tags for all articles*/
    private void setArticlesInTags(User user, Jedis jedis) {
        List<TagUser> tagUsers = tagUserDao.findTagByUser(user);
        if (tagUsers==null) {
            return;
        }
        List<Integer> tagIds = new ArrayList<Integer>();
        for (TagUser tagUser : tagUsers) {
            if (tagUser==null) {
                continue;
            }
            tagIds.add(tagUser.getTagId().getId());
        }
        if (tagIds==null || tagIds.size()<=0){
            return;
        }
        List<Integer> articleIds = tagPostDao.findArticlesIdsInTags(tagIds);
        if (articleIds==null) {
            return;
        }
        Double fakeScore = 1000.0;
        try {
            jedis.zremrangeByRank(ARTICLE + user.getId(),0,1000);
        } catch (Exception e){

        }
        for (Integer articleId : articleIds) {
            try {
                jedis.zadd(ARTICLE + user.getId(), fakeScore, Integer.toString(articleId));
            } catch (Exception e) {

            }
            fakeScore = fakeScore + 1;
        }
    }

    private void setArticlesInKnow(User user, Jedis jedis) {
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        if (classrooms == null) {
            return;
        }
        List<Post> articles = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentArticles = postDao.findArticleByOwnerClassroom(classroom);
            if (currentArticles == null) {
                continue;
            }
            for (Post currentArticle : currentArticles) {
                if (currentArticle == null) {
                    continue;
                }
                articles.add(currentArticle);
            }
        }
        Double fakeScore = 1.0;
        for (Post article : articles) {
            try {
                // if article did not already exist in Redis DB
                if (jedis.zrank(ARTICLE + user.getId(),Integer.toString(article.getId()))==null) {
                    jedis.zadd(ARTICLE + user.getId(),fakeScore, Integer.toString(article.getId()));
                }
            } catch (Exception e) {

            }
            fakeScore = fakeScore + 1;
        }
    }

    private void setMaterialInTags(User user, Jedis jedis){
        List<TagUser> tagUsers = tagUserDao.findTagByUser(user);
        if (tagUsers==null) {
            return;
        }
        List<Integer> tagIds = new ArrayList<Integer>();
        for (TagUser tagUser : tagUsers) {
            if (tagUser==null) {
                continue;
            }
            tagIds.add(tagUser.getTagId().getId());
        }
        if (tagIds==null || tagIds.size()<=0){
            return;
        }
        List<Integer> materialIds = tagMaterialDao.findMaterialIdsInTags(tagIds);
        if (materialIds==null) {
            return;
        }
        try {
            jedis.zremrangeByRank(MATERIAL + user.getId(),0,1000);
        } catch (Exception e){

        }
        Double fakeScore = 1000.0;
        for (Integer materialId : materialIds) {
            try {
                jedis.zadd(MATERIAL + user.getId(), fakeScore, Integer.toString(materialId));
            } catch (Exception e) {

            }
            fakeScore = fakeScore + 1;
        }
    }

    private void setMaterialInKnow(User user, Jedis jedis){
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        if (classrooms == null) {
            return;
        }
        List<Material> materials = new ArrayList<Material>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Material> currentMaterials = materialDao.findMaterialByOwnerClassroom(classroom);
            if (currentMaterials == null) {
                continue;
            }
            for (Material currentMaterial : currentMaterials) {
                if (currentMaterial == null) {
                    continue;
                }
                materials.add(currentMaterial);
            }
        }
        Double fakeScore = 1.0;
        for (Material material : materials) {
            try {
                // if article did not already exist in Redis DB
                if (jedis.zrank(MATERIAL + user.getId(),Integer.toString(material.getId()))==null) {
                    jedis.zadd(MATERIAL + user.getId(),fakeScore, Integer.toString(material.getId()));
                }
            } catch (Exception e) {

            }
            fakeScore = fakeScore + 1;
        }
    }

    private List<Post> getQuestionsFromRedis(Integer userId) {
        Integer start = 0;
        Integer stop = 1000;
        List<Post> questions = new ArrayList<Post>();
        try {
            Jedis jedis = new Jedis(SERVER);
            Set<String> questionInClassIdsSet = jedis.zrevrange(QUESTION_IN_CLASS + userId, start, stop);
            Set<String> questionInFollowIdsSet = jedis.zrevrange(QUESTION_IN_FOLLOW + userId, start,
                    stop);
            Set<String> questionInKnowIdsSet = jedis.zrevrange(QUESTION_IN_KNOW + userId, start, stop);
            for (String sId : questionInClassIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Post currentQuestion = postDao.find(iId);
                if (currentQuestion != null) {
                    questions.add(currentQuestion);
                }
            }
            for (String sId : questionInFollowIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Post currentQuestion = postDao.find(iId);
                if (currentQuestion != null) {
                    questions.add(currentQuestion);
                }
            }
            for (String sId : questionInKnowIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Post currentQuestion = postDao.find(iId);
                if (currentQuestion != null) {
                    questions.add(currentQuestion);
                }
            }
            return questions;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    private List<Post> getArticlesFromRedis(Integer userId){
        Integer start = 0;
        Integer stop = 1000;
        List<Post> articles = new ArrayList<Post>();
        try {
            Jedis jedis = new Jedis(SERVER);
            Set<String> articleIdsSet = jedis.zrevrange(ARTICLE + userId,start,stop);
            for (String sId : articleIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Post currentArticle = postDao.find(iId);
                if (currentArticle != null) {
                    articles.add(currentArticle);
                }
            }
            return articles;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return articles;
    }

    private List<Material> getMaterialsFromRedis(Integer userId){
        Integer start = 0;
        Integer stop = 1000;
        List<Material> materials = new ArrayList<Material>();
        try {
            Jedis jedis = new Jedis(SERVER);
            Set<String> materialIdsSet = jedis.zrevrange(MATERIAL + userId,start,stop);
            for (String sId : materialIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Material currentMaterial = materialDao.find(iId);
                if (currentMaterial != null) {
                    materials.add(currentMaterial);
                }
            }
            return materials;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return materials;
    }

    private Double calculateScore(User user, Post question) {
        List<Post> answers = postDao.findRepliesByParentId(question.getId());
        DateTime toDate = new DateTime();
        DateTime maxDate = new DateTime(question.getLastEditedDate());
        int iView = question.getViewer();
        int iWantAnswer = wantAnswerDao.countWantAnswerByPost(question);
        int iAnswer = 0;
        int iAccepted = 0;

        if (answers != null) {
            iAnswer = answers.size();
            for (Post answer : answers) {
                DateTime newDate = new DateTime(answer.getLastEditedDate());
                if (newDate.isAfter(maxDate)) {
                    maxDate = new DateTime(newDate);
                }
                if (user.getRoleId().getId() == STUDENT) {
                    if (answer.getAcceptedAnswerId() == ACCEPTED) {
                        iAccepted = 1;
                    }
                }

            }
        }

        Double iHours = Hours.hoursBetween(maxDate, toDate).getHours() * 1.0;
        if (iHours == 0.0) {
            iHours = 0.9;
        }

        Double score = (3.0 * iWantAnswer + 2.0 * iView + iAnswer - iAccepted) / iHours;
        return score;
    }

}
