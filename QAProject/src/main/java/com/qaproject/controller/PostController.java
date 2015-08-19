package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import com.qaproject.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/4/2015.
 */
@Controller
public class PostController {

    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostDao postDao;
    @Autowired
    TagDao tagDao;
    @Autowired
    TagPostDao tagPostDao;
    @Autowired
    HttpSession session;
    @Autowired
    UserDao userDao;
    @Autowired
    WantAnswerDao wantAnswerDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    DashboardUtilities dashboardUtilities;
    @Autowired
    NotificationUtilities notificationUtilities;
    @Autowired
    NotificationDao notificationDao;
    @Autowired
    TagMaterialDao tagMaterialDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    SendMailUtilities sendMailUtilities;
    @Autowired
    SimpMessagingTemplate template;

    @RequestMapping(value = "/post/add", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String addStock(@ModelAttribute PostDto postDto) throws Exception {
        //Need to edit subcrible
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        Post parentId = postDao.find(postDto.getParentId());
        if (parentId == null) {
            return "NG";
        }
        if(parentId.getParentId()!=0) {
            return "NG";
        }
        if (user != null) {
            if (0 != parentId.getStatus()) {
                //check user can comment or not .
                if (user.getId() == parentId.getOwnerUserId().getId()) {
                    //check user is post owner
                    parentId.setIsComment(1);
                }
                if (0 == parentId.getIsComment()) {
                    // check user is class's teacher
                    if (user.getId() == parentId.getOwnerClassId().getOwnerUserId().getId()) {
                        parentId.setIsComment(1);
                    }
                }
                if (0 == parentId.getIsComment() && user.getRoleId().getId() == Constant.TEACHER) {
                    // check user was invitated
                    List<PostInvitation> postInvitations = parentId.getPostInvitationList();
                    for (int i = 0; i < postInvitations.size(); i++) {
                        if (user.getId() == postInvitations.get(i).getTeacherId().getId()) {
                            parentId.setIsComment(1);
                            break;
                        }
                    }

                }
                if (0 == parentId.getIsComment()) {
                    //check List User in Classrom
                    List<ClassroomUser> classroomUsers = parentId.getOwnerClassId().getClassroomUserList();
                    for (int i = 0; i < classroomUsers.size(); i++) {
                        if (user.getId() == classroomUsers.get(i).getUserId().getId()) {
                            if(classroomUsers.get(i).getApproval()==Constant.IA_APPROVAL) {
                                parentId.setIsComment(1);
                                break;
                            }

                        }
                    }
                }
            }
        }
        if (parentId.getIsComment() == 0) {
            return "NG";
        }
        Post post = new Post();
        post.setBody(postDto.getBody());
        post.setLastEditedDate(new Date());
        post.setCreationDate(new Date());
        post.setPostType(3);
        post.setAcceptedAnswerId(0);
        post.setParentId(postDto.getParentId());
        post.setOwnerClassId(parentId.getOwnerClassId());
        post.setOwnerUserId(userDao.find(postDto.getOwnerId()));
        postDao.persist(post);
        sendNotificationReplies(user, post);
        return "OK";
    }

    @RequestMapping(value = "/post/add/all", method = RequestMethod.POST)
    public String addAnswerAll(@RequestParam List<Integer> ids, @RequestParam String detail, @RequestParam Integer classroomId,@RequestParam(required = false) Integer range) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/merge/" + classroomId + "/" + range);
            return "redirect:/";
        }
        for (int i = 0; i < ids.size(); i++) {
            Post parent = postDao.find(ids.get(i));
            if(parent==null){
                return "404";
            }
            if(parent.getParentId()!=0) {
                return "NG";
            }
            //authorize
            if (user.getId() != parent.getOwnerClassId().getOwnerUserId().getId()) {
                return "403";
            }
            if (classroomId != parent.getOwnerClassId().getId()) {
                return "403";
            }
            if (parent.getStatus() == Constant.CLOSE_POST) {
                return "403";
            }
            if (parent.getAcceptedAnswerId() == 1) {
                return "403";
            }
            if (parent.getParentId() != 0) {
                return "403";
            }
            Post post = new Post();
            post.setBody(detail);
            post.setLastEditedDate(new Date());
            post.setCreationDate(new Date());
            post.setPostType(3);
            post.setAcceptedAnswerId(0);
            post.setParentId(parent.getId());
            post.setOwnerClassId(parent.getOwnerClassId());
            post.setOwnerUserId(user);
            postDao.persist(post);
            sendNotificationReplies(user, post);
        }
        if(range==null) {
            return "redirect:/post/merge/"+ids.get(0);
        }
        return "redirect:/post/merge/" + classroomId + "/" + range;
    }

    /*
    * user : who was created answer
    * post : is answer of question .
    */
    public void sendNotificationReplies(User user, Post post) {
        User sender = userDao.find(user.getId());
        Post parent = postDao.find(post.getParentId());
        //Edit realtime KhangTN
        PostDto postDto = ConvertEntityDto.convertPostEntityToDto(post);
        List<User> receivers = userDao.findUserNotificationByPost(parent.getId());
        for (User receiver : receivers) {
            if (receiver.getId() != user.getId()) {
                Notification notification = new Notification();
                notification.setReceiverId(receiver);
                notification.setSenderId(sender);
                notification.setObjectId(post.getParentId());
                notification.setNotificationType(Constant.NT_USER_REPLY);
                notification.setIsViewed(Constant.IV_FALSE);
                notificationDao.persist(notification);
                NotificationDto notificationDto = ConvertEntityDto.convertNotificationEntityToDto(notification, notification.getNotificationType(), parent);
                template.convertAndSend("/topic/notice/" + receiver.getId(), notificationDto);
            }
        }
        template.convertAndSend("/topic/discussion/" + post.getParentId(), postDto);
    }

    @RequestMapping(value = "/post/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        //check if not parent Post return 404.
        Post post = postDao.find(id);
        if (post == null || 0 != post.getParentId()) {
            return "404";
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/view/" + id);
            return "redirect:/";
        }
        if (user != null) {
            if (0 != post.getStatus()) {
                //check user can comment or not .
                if (user.getId() == post.getOwnerUserId().getId()) {
                    //check user is post owner
                    post.setIsComment(1);
                }
                if (0 == post.getIsComment()) {
                    // check user is class's teacher
                    if (user.getId() == post.getOwnerClassId().getOwnerUserId().getId()) {
                        post.setIsComment(1);
                    }
                }
                if (0 == post.getIsComment() && user.getRoleId().getId() == Constant.TEACHER) {
                    // check user was invitated
                    List<PostInvitation> postInvitations = post.getPostInvitationList();
                    for (int i = 0; i < postInvitations.size(); i++) {
                        if (user.getId() == postInvitations.get(i).getTeacherId().getId()) {
                            post.setIsComment(1);
                            break;
                        }
                    }

                }
                if (0 == post.getIsComment()) {
                    //check List User in Classrom
                    List<ClassroomUser> classroomUsers = post.getOwnerClassId().getClassroomUserList();
                    for (int i = 0; i < classroomUsers.size(); i++) {
                        if (user.getId() == classroomUsers.get(i).getUserId().getId()) {
                            if(classroomUsers.get(i).getApproval()==Constant.IA_APPROVAL) {
                                post.setIsComment(1);
                                break;
                            }
                        }
                    }
                }
            }
        }

        //get tag list of post
        List<Integer> tagIds = new ArrayList<Integer>();
        for (int i = 0; i < post.getTagPostList().size(); i++) {
            tagIds.add(post.getTagPostList().get(i).getTagId().getId());
        }

        //get related questions - MinhKH
        List<Integer> relatedQuestionIds = tagPostDao.findRelatedQuestionIds(tagIds, 30);
        List<Post> questionByTitles = postDao.findRelatedQuestion(post.getTitle());
        List<Post> relatedQuestions = new ArrayList<Post>();
        if (relatedQuestionIds!=null) {
            relatedQuestionIds.remove(post.getId());
        }
        if (questionByTitles!=null){
            if (relatedQuestionIds==null) {
                if (questionByTitles.size()>10){
                    relatedQuestions.addAll(questionByTitles.subList(0,10));
                } else {
                    relatedQuestions.addAll(questionByTitles);
                }
            } else {
                for (Post questionByTitle : questionByTitles) {
                    for (Integer currentRelatedQuestionId : relatedQuestionIds) {
                        if (currentRelatedQuestionId.compareTo(questionByTitle.getId())==0) {
                            relatedQuestions.add(questionByTitle);
                        }
                    }
                    if (relatedQuestions.size() == 10) {
                        break;
                    }
                }
            }
        } if (questionByTitles == null || questionByTitles.size()==0){
            if (relatedQuestionIds!=null){
                Integer maxSize = 10;
                if (relatedQuestionIds.size()<=10)  {
                    maxSize = relatedQuestionIds.size();
                }
                for (int i=0; i<maxSize; i ++){
                    Post currentQuestion = postDao.find(relatedQuestionIds.get(i));
                    relatedQuestions.add(currentQuestion);
                }
            }
        }

        //get related articles
        List<Post> relatedArticles = new ArrayList<Post>();
        List<Integer> relatedArticlesIds = tagPostDao.findRelatedArticlesIds(tagIds, 30);
        if (relatedArticlesIds!=null) {
            relatedArticlesIds.remove(post.getId());
        }
        List<Post> articleByTitles = postDao.findRelatedArticle(post.getTitle());
        if (articleByTitles!=null) {
            if (relatedArticlesIds==null){
                if (articleByTitles.size()>10) {
                    relatedArticles.addAll(articleByTitles.subList(0,10));
                } else {
                    relatedArticles.addAll(articleByTitles);
                }
            } else {
                for (Post articleByTitle : articleByTitles) {
                    if (articleByTitle.getId() != post.getId()) {
                        for (Integer currentRelatedArticlesId: relatedArticlesIds) {
                            if (articleByTitle.getId().compareTo(currentRelatedArticlesId)==0) {
                                relatedArticles.add(articleByTitle);
                            }
                        }
                    }
                    if (relatedArticles.size()==10){
                        break;
                    }
                }
            }
        } if (articleByTitles==null || articleByTitles.size()==0){
            if (relatedArticlesIds!=null){
                Integer maxSize = 10;
                if (relatedArticlesIds.size()<=10)  {
                    maxSize = relatedArticlesIds.size();
                }
                for (int i=0; i<maxSize; i ++){
                    Post currentArticle = postDao.find(relatedArticlesIds.get(i));
                    relatedArticles.add(currentArticle);
                }
            }
        }

        //get related materials
        List<Material> relatedMaterials = new ArrayList<Material>();
        List<Integer> relatedMaterialIds = tagMaterialDao.findRelatedMaterialIds(tagIds, 30);
        List<Material> materialByNames = materialDao.findRelatedMaterial(post.getTitle());
        if (materialByNames!=null) {
            if (relatedMaterialIds==null) {
                if (materialByNames.size()>10){
                    relatedMaterials.addAll(materialByNames.subList(0,10));
                } else {
                    relatedMaterials.addAll(materialByNames);
                }

            } else {
                for (Material materialByName : materialByNames) {
                    for (Integer currentRelatedMaterialId: relatedMaterialIds) {
                        if (materialByName.getId().compareTo(currentRelatedMaterialId)==0){
                            relatedMaterials.add(materialByName);
                        }
                    }
                    if (relatedMaterials.size()==10) {
                        break;
                    }
                }
            }
        } if (materialByNames==null || materialByNames.size()==0){
            if (relatedMaterialIds!=null){
                Integer maxSize = 10;
                if (relatedMaterialIds.size()<=10)  {
                    maxSize = relatedMaterialIds.size();
                }
                for (int i=0; i<maxSize; i ++){
                   Material currentMaterial = materialDao.find(relatedMaterialIds.get(i));
                   relatedMaterials.add(currentMaterial);
                }
            }
        }

        //get List Post answer
        List<Post> postAnswers = postDao.findPostChilds(id, 0);
        //get number answers
        Integer count = postDao.countAnswers(post.getId());
        model.addAttribute("numberAnswer",count);
        model.addAttribute("post", post);
        model.addAttribute("relatedArticles", relatedArticles);
        model.addAttribute("relatedMaterials", relatedMaterials);
        model.addAttribute("relatedQuestions", relatedQuestions);
        model.addAttribute("postAnswers", postAnswers);
        if (user != null) {
            WantAnswerPost wantAnswerPost = post.checkWantToAnswer(user.getId());
            if (wantAnswerPost != null) {
                model.addAttribute("wantAnswer", wantAnswerPost);
            }
        }
        if (post.getPostType() == 1) {
            return "question";
        }
        return "article";
    }

    @RequestMapping(value = "post/view/{id}/{lastestId}", produces = "application/json", method = RequestMethod.GET)
    public
    @ResponseBody
    List<PostDto> loadMoreAnswer(@PathVariable Integer id, @PathVariable Integer lastestId) {
        List<PostDto> postDtos = null;
        try {
            postDtos = postDao.loadMoreAnswer(id, lastestId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postDtos;
    }

    @RequestMapping(value = "/post/create/{id}", method = RequestMethod.GET)
    public String createDispath(@PathVariable Integer id, ModelMap model) {
        Classroom classroom = classroomDao.find(id);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/create/" + id);
            return "redirect:/";
        }
        //Check User have joint to Class
        if (classroom.checkUserExist(user) == false) {
            return "redirect:/classroom/" + id;
        }
        if (classroom == null) {
            return "404";
        }
        model.addAttribute("classroom", classroom);
        return "createPost";
    }

    @RequestMapping(value = "/post/update/{id}", method = RequestMethod.GET)
    public String updateDispath(@PathVariable Integer id, ModelMap model) {
        Post post = postDao.find(id);
        User user = (User) session.getAttribute("user");
        //validate authorize
        if (post == null) {
            return "404";
        }
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/update/" + id);
            return "redirect:/";
        }
        if (post.getOwnerUserId().getId() != user.getId()) {
            return "403";
        }
        Classroom classroom = post.getOwnerClassId();
        model.addAttribute("classroom", classroom);
        model.addAttribute("post", post);
        return "createPost";
    }

    @RequestMapping(value = "/post/create", method = RequestMethod.POST)
    public String createPost(@RequestParam Integer classId,
                         @RequestParam(required = false) List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
                         @RequestParam String postName,
                         @RequestParam Integer postType,
                         @RequestParam String postDetail,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        Classroom classroom = classroomDao.find(classId);
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/create/" + classId);
            return "redirect:/";
        }
        if (classroom == null) {
            return "404";
        }
        if(classroom.getStatus()==0) {
            return "/classroom" + classId;
        }
        //Check User have joint to Class
        if (classroom.checkUserExist(user) == false) {
            return "/classroom/" + classId;
        }
        if (postName.length() <= 0 || postName.length() > 255) {
            return "redirect:/post/create/" + classId;
        }
        if (postType != 1 && postType != 2) {
            return "redirect:/post/create/" + classId;
        }
        int tagIdSize = 0;
        if (tagId != null) {
            tagIdSize = tagId.size();
        }
        int newTagSize = 0;
        if (newTag != null) {
            newTagSize = newTag.size();
        }
        if ((tagIdSize + newTagSize) < 1 || (tagIdSize + newTagSize) > 5) {
            return "redirect:/post/create/" + classId;
        }
        if (postDetail.length() < 120) {
            return "redirect:/post/create/" + classId;
        }

        Post post = new Post();
        post.setTitle(postName);
        post.setPostType(postType);
        post.setOwnerClassId(classroom);
        post.setOwnerUserId(user);
        post.setBody(postDetail);
        post.setViewer(0);
        post.setAcceptedAnswerId(0);
        post.setParentId(0);
        post.setStatus(1);
        post.setCreationDate(new Date());
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        if(tagId!=null) {
        for (int i = 0; i < tagId.size(); i++) {
            TagPost tagPost = new TagPost();
            tagPost.setPostId(post);
            Tag tagfind = tagDao.find(tagId.get(i));
            if (tagfind == null) {
                return "404";
            }
            tagPost.setTagId(tagfind);
            tagPosts.add(tagPost);
        }
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tag.setTagCount(0);
                tagDao.persist(tag);
                tagPost.setTagId(tag);
                tagPosts.add(tagPost);
            }
        }
        post.getTagPostList().addAll(tagPosts);
        classroom.setActiveTime(new Date());
        postDao.persist(post);
        if (post.getPostType() == 1 && post.getOwnerClassId().getOwnerUserId().getId().compareTo(user.getId())!=0) {
            sendMailUtilities.sendEmail(post);
        }
        classroomDao.merge(classroom);

        //Notification - MinhKH
        List<ClassroomUser> inClassStudents = classroomUserDao.findByClassroom(classroom);
        ClassroomUser classroomTeacher = new ClassroomUser();
        classroomTeacher.setUserId(classroom.getOwnerUserId());
        ;
        inClassStudents.add(classroomTeacher);
        if (inClassStudents != null) {
            if (user.getRoleId().getId() == Constant.STUDENT) {
                //if student create post.
                for (ClassroomUser classroomUser : inClassStudents) {
                    if (user.getId() != classroomUser.getUserId().getId()) {
                        Notification notification = new Notification();
                        notification.setReceiverId(classroomUser.getUserId());
                        notification.setSenderId(user);
                        notification.setObjectId(post.getId());
                        notification.setNotificationType(Constant.NT_STUDENT_CREATE_POST);
                        notification.setIsViewed(Constant.IV_FALSE);
                        notificationDao.persist(notification);
                        NotificationDto notificationDto = ConvertEntityDto.convertNotificationEntityToDto(notification, notification.getNotificationType(), post);
                        template.convertAndSend("/topic/notice/" + classroomUser.getUserId().getId(), notificationDto);
                    }

                }

            } else {
                List<User> users = userDao.findUserNotificationByCreatePostTeacher(classroom.getOwnerUserId().getId(), classroom.getId());
                for (User userInvi : users) {
                    if (user.getId() != userInvi.getId()) {
                        Notification notification = new Notification();
                        notification.setReceiverId(userInvi);
                        notification.setSenderId(user);
                        notification.setObjectId(post.getId());
                        notification.setNotificationType(Constant.NT_TEACHER_CREATE_POST);
                        notification.setIsViewed(Constant.IV_FALSE);
                        notificationDao.persist(notification);
                        NotificationDto notificationDto = ConvertEntityDto.convertNotificationEntityToDto(notification, notification.getNotificationType(), post);
                        template.convertAndSend("/topic/notice/" + userInvi.getId(), notificationDto);
                    }

                }
            }

        }
        return "redirect:/post/view/" + post.getId();
    }


    @RequestMapping(value = "/post/update", method = RequestMethod.POST)
    public String update(@RequestParam Integer id,
                         @RequestParam(required = false) List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
                         @RequestParam String postName,
                         @RequestParam Integer postType,
                         @RequestParam String postDetail,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        Post post = postDao.find(id);
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/update/" + id);
            return "redirect:/";
        }
        if (post == null) {
            return "404";
        }
        if (postName.length() <= 0 || postName.length() > 255) {
            return "redirect:/post/update/" + id;
        }
        if (postType != 1 && postType != 2) {
            return "redirect:/post/update/" + id;
        }
        int tagIdSize = 0;
        if (tagId != null) {
            tagIdSize = tagId.size();
        }
        int newTagSize = 0;
        if (newTag != null) {
            newTagSize = newTag.size();
        }
        if ((tagIdSize + newTagSize) < 1 || (tagIdSize + newTagSize) > 5) {
            return "redirect:/post/update/" + id;
        }
        if (postDetail.length() < 120) {
            return "redirect:/post/update/" + id;
        }
        post.setTitle(postName);
        post.setPostType(postType);
        post.setBody(postDetail);
        post.setParentId(0);
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        if(tagId!=null) {
            for (int i = 0; i < tagId.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tagfind = tagDao.find(tagId.get(i));
                if (tagfind == null) {
                    return "404";
                }
                tagPost.setTagId(tagfind);
                tagPosts.add(tagPost);
            }
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tag.setTagCount(0);
                tagDao.persist(tag);
                tagPost.setTagId(tag);
                tagPosts.add(tagPost);
            }
        }
        post.getTagPostList().clear();
        post.getTagPostList().addAll(tagPosts);
        postDao.merge(post);
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/wantAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String addWantAnswer(@ModelAttribute("wantAnswerDto") WantAnswerDto wantAnswerDto) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        Post post = postDao.find(wantAnswerDto.getPostId());
        if(post==null || post.getPostType()!=1) {
            return "NG";
        }
        WantAnswerPost wantAnswerPost = new WantAnswerPost();
        wantAnswerPost.setPostId(post);
        wantAnswerPost.setUserId(user);
        try {
            wantAnswerDao.persist(wantAnswerPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return String.valueOf(wantAnswerPost.getId());
    }

    @RequestMapping(value = "/post/dontWantAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String removeWantAnswer(@ModelAttribute("wantAnswerDto") WantAnswerDto wantAnswerDto) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        try {
            WantAnswerPost wantAnswerPost = wantAnswerDao.find(wantAnswerDto.getId());
            wantAnswerDao.remove(wantAnswerPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }

    @RequestMapping(value = "/post/acceptAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String acceptAnswer(@ModelAttribute("acceptAnswerDto") AcceptAnswerDto acceptAnswerDto) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        try {
            Post post;
            Integer idUnaccept = acceptAnswerDto.getIdUnaccept();
            Integer id = acceptAnswerDto.getId();
            post = postDao.find(id);
            if (post == null) {
                return "NG";
            }
            Post parentPost;
            parentPost = postDao.find(post.getParentId());
            if (parentPost == null || parentPost.getPostType()!=1) {
                return "NG";
            }
            if (user.getId()!=parentPost.getOwnerUserId().getId()) {
                return "NG";
            }
            if(post.getOwnerUserId().getId()==parentPost.getOwnerUserId().getId()){
                return "NG";
            }
            List<Post> posts = postDao.findRepliesWasAcceptedByParentId(post.getParentId());
            if (posts != null) {
                for (int i = 0; i < posts.size(); i++) {
                    Post postUn = posts.get(i);
                    postUn.setAcceptedAnswerId(Constant.UNACCEPT_ANSWER);
                    postDao.merge(postUn);
                }
            }
            post.setAcceptedAnswerId(Constant.ACCEPT_ANSWER);
            postDao.merge(post);
            parentPost.setAcceptedAnswerId(Constant.ACCEPT_ANSWER);
            postDao.merge(parentPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }

    @RequestMapping(value = "/post/removeAcceptAnswer/{id}", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String removeAcceptAnswer(@PathVariable Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        try {
            Post post = postDao.find(id);
            if (post == null) {
                return "NG";
            }
            Post parentPost;
            parentPost = postDao.find(post.getParentId());
            if (parentPost == null) {
                return "NG";
            }
            if (user.getId().compareTo(parentPost.getOwnerUserId().getId())!=0) {
                return "NG";
            }
            post.setAcceptedAnswerId(0);
            postDao.merge(post);
            parentPost.setAcceptedAnswerId(Constant.UNACCEPT_ANSWER);
            postDao.merge(parentPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }

    @RequestMapping(value = "dashboard/postInvitation/{lastId}", produces = "application/json",
            method = RequestMethod.GET)
    public
    @ResponseBody
    List<PostInvitationDto> loadPostInvitation(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        List<PostInvitationDto> postInvitationDtos = null;
        try {
            postInvitationDtos = dashboardUtilities.loadPostInvitations(user.getId(), lastId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postInvitationDtos;
    }

    @RequestMapping(value = "/post/updateAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String updateAnswer(@ModelAttribute(value = "postDto") PostDto postDto) {
        try {
            Post post = postDao.find(postDto.getId());
            post.setBody(postDto.getBody());
            post.setLastEditedDate(new Date());
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/post/updateAnswer/{id}", method = RequestMethod.GET, produces = "application/json")
    public
    @ResponseBody
    String updateAnswer(@PathVariable Integer id) {
        Post post;
        String body = "";
        try {
            post = postDao.find(id);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        if (post != null) {
            body = post.getBody();
        }
        return body;
    }

    @RequestMapping(value = "/post/deleteAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String deleteAnswer(@ModelAttribute(value = "postDto") PostDto postDto) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        Post post;

        try {
            post = postDao.find(postDto.getId());
            if (post.getOwnerUserId().getId().compareTo(user.getId())==0 || user.getRoleId().getId()==3) {
                if(post.getAcceptedAnswerId()==Constant.ACCEPT_ANSWER) {
                    Post parent = postDao.find(post.getParentId());
                    parent.setAcceptedAnswerId(Constant.UNACCEPT_ANSWER);
                    postDao.merge(parent);
                }
                postDao.remove(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/post/deletePost", method = RequestMethod.POST)
    public String deletePost(@RequestParam Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/view/" + id);
            return "redirect:/";
        }
        Post post;
        Integer classId;
        try {
            post = postDao.find(id);
            if (post == null) {
                return "404";
            }
            classId = post.getOwnerClassId().getId();
            if (post.getOwnerUserId().getId() == user.getId() || user.getRoleId().getId()==3) {
                postDao.remove(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "403";
        }
        return "redirect:/classroom/" + classId;
    }

    @RequestMapping(value = "/post/closePost", method = RequestMethod.POST)
    public String closePost(@RequestParam Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/view/" + id);
            return "redirect:/";
        }
        Post post = null;
        try {
            post = postDao.find(id);
            if (post == null) {
                return "404";
            }
            if (post.getOwnerUserId().getId() == user.getId() || post.getOwnerClassId().getOwnerUserId().getId() == user.getId() || user.getRoleId().getId() == 3) {
                post.setStatus(Constant.CLOSE_POST);
                postDao.merge(post);
            } else {
                return "403";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/openPost", method = RequestMethod.POST)
    public String openPost(@RequestParam Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/view/" + id);
            return "redirect:/";
        }
        Post post = null;
        try {
            post = postDao.find(id);
            if (post == null) {
                return "404";
            }
            if (post.getOwnerUserId().getId() == user.getId() || post.getOwnerClassId().getOwnerUserId().getId() == user.getId() || user.getRoleId().getId() == 3) {
                post.setStatus(Constant.OPEN_POST);
                postDao.merge(post);
            } else {
                return "403";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/count/{id}", method = RequestMethod.POST, produces = "application/json")
    public String updateView(@PathVariable Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        Post post = null;
        try {
            post = postDao.find(id);
            if (post.getViewer() == null) {
                post.setViewer(0);
            } else {
                post.setViewer(post.getViewer() + 1);
            }
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/suggest", method = RequestMethod.GET, produces = "application/json")
    public
    @ResponseBody
    List<PostDto> suggestPost(@RequestParam String title) {
        User user = (User) session.getAttribute("user");
        List<PostDto> postDtos = null;
        if (user == null) {
            return postDtos;
        }
        postDtos = postDao.listSuggestPost(title);
        return postDtos;
    }

    @RequestMapping(value = "/post/merge/{id}/{range}", method = RequestMethod.GET)
    public String mergeDispath(@PathVariable Integer id, @PathVariable Integer range, ModelMap model) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/merge/" +id + "/" + range);
            return "redirect:/";
        }
        Classroom classroom = classroomDao.find(id);
        if (classroom.getOwnerUserId().getId() != user.getId()) {
            return "403";
        }
        Double rangeDou = range * 0.01;
        List<Post> posts = postDao.listQuestionMerge(id,0.0);
        model.addAttribute("classroom", classroom);
        model.addAttribute("posts", posts);
        model.addAttribute("range",range);
        return "mergeQuestion";
    }
    @RequestMapping(value = "/post/merge/{id}", method = RequestMethod.GET)
    public String mergeDispath(@PathVariable Integer id, ModelMap model) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "403";
        }
        Post post = postDao.find(id);
        if(post==null) {
            return "404";
        }
        if (post.getOwnerClassId().getOwnerUserId().getId() != user.getId()) {
            return "403";
        }
        List<Post> posts = postDao.listQuestionMerge(post.getTitle(),post.getOwnerClassId().getId());
        model.addAttribute("classroom", post.getOwnerClassId());
        model.addAttribute("posts", posts);
        model.addAttribute("fulltext","fulltext");
        return "mergeQuestion";
    }
    @RequestMapping(value = "/post/merge", method = RequestMethod.GET)
    public String mergeDispath(@RequestParam List<Integer> postMerges,@RequestParam Integer id,ModelMap model) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user==null) {
            return "403";
        }
        Classroom classroom = classroomDao.find(id);
        if(classroom==null) {
            return "404";
        }
        if(classroom.getOwnerUserId().getId()!=user.getId()){
            return "403";
        }
        List<Post> posts = new ArrayList<Post>();
        int count = 0;
        for(int i = 0 ; i < postMerges.size();i++) {
            for(int j = 0 ; j < postMerges.size() ; j++) {
                if(postMerges.get(i).compareTo(postMerges.get(j))==0) {
                    count++;
                    if(count==2) {
                        return "404";
                    }

                }
            }
            count = 0;
        }
        for(int i = 0 ; i < postMerges.size() ; i++) {
            Post post = postDao.find(postMerges.get(i));
            if(post==null) {
                return "404";
            }
            if(post.getOwnerClassId().getId()!=id){
                return "404";
            }
            posts.add(post);
        }
        model.addAttribute("posts",posts);
        model.addAttribute("classroom",classroom);
        return "createPost";
    }
    @RequestMapping(value = "/post/merge", method = RequestMethod.POST)
    public String merge(@RequestParam List<Integer> postMerges,
                        @RequestParam Integer primaryid,
                        @RequestParam List<Integer> tagId,
                        @RequestParam(required = false) List<String> newTag,
                        @RequestParam String postName,
                        @RequestParam String postDetail) {
        User user = (User) session.getAttribute("user");
        Post post = postDao.find(primaryid);
        List<Post> postMergeList = null;
        if (user == null) {
            session.setAttribute("currentPage", "redirect:/post/update/" + primaryid);
            return "redirect:/";
        }
        if (post == null) {
            return "404";
        }
        if (postName.length() <= 0 || postName.length() > 255) {
            return "redirect:/post/merge/" + primaryid;
        }
        int tagIdSize = 0;
        if (tagId != null) {
            tagIdSize = tagId.size();
        }
        int newTagSize = 0;
        if (newTag != null) {
            newTagSize = newTag.size();
        }
        if ((tagIdSize + newTagSize) < 1 || (tagIdSize + newTagSize) > 5) {
            return "redirect:/post/merge/" + primaryid;
        }
        if (postDetail.length() < 120) {
            return "redirect:/post/merge/" + primaryid;
        }
        if(postMerges!=null) {
            postMergeList = new ArrayList<Post>();
            for(int i = 0 ; i < postMerges.size();i++) {
                if(postMerges.get(i) > primaryid || postMerges.get(i) < primaryid ) {
                    Post postMerge = postDao.find(postMerges.get(i));
                    if(postMerges==null) {
                        return "404";
                    } else {
                        postMergeList.add(postMerge);
                    }
                }
            }
        }
        post.setTitle(postName);
        post.setBody(postDetail);
        post.setParentId(0);
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        for (int i = 0; i < tagId.size(); i++) {
            TagPost tagPost = new TagPost();
            tagPost.setPostId(post);
            Tag tagfind = tagDao.find(tagId.get(i));
            if (tagfind == null) {
                return "404";
            }
            tagPost.setTagId(tagfind);
            tagPosts.add(tagPost);
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tag.setTagCount(0);
                tagDao.persist(tag);
                tagPost.setTagId(tag);
                tagPosts.add(tagPost);
            }
        }
        post.getTagPostList().clear();
        post.getTagPostList().addAll(tagPosts);
        postDao.merge(post);
        if(postMergeList!=null) {
            for(int i = 0 ; i < postMergeList.size();i++) {
                Post postClose = postMergeList.get(i);
                //create comment to notice user , his post was merged
                Post postmergeAnswer = new Post();
                postmergeAnswer.setBody("This question was merged and answered by " + postClose.getOwnerClassId().getOwnerUserId().getDisplayName() + ",You can read it in this <a href='/post/view/"+ primaryid +"'>Question</a>");
                postmergeAnswer.setLastEditedDate(new Date());
                postmergeAnswer.setCreationDate(new Date());
                postmergeAnswer.setPostType(3);
                postmergeAnswer.setAcceptedAnswerId(0);
                postmergeAnswer.setParentId(postClose.getId());
                postmergeAnswer.setOwnerClassId(postClose.getOwnerClassId());
                postmergeAnswer.setOwnerUserId(user);
                postDao.persist(postmergeAnswer);
                // close post merge
                postClose.setStatus(Constant.CLOSE_POST);
                postDao.merge(postClose);
                // send notification
                sendNotificationReplies(user,postmergeAnswer);
            }
        }
        return "redirect:/post/view/"+primaryid;
    }

}
