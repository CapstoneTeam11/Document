package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import info.debatty.java.stringsimilarity.Jaccard;
import info.debatty.java.stringsimilarity.NGram;
import org.springframework.stereotype.Repository;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class PostDaoImpl extends BaseDao<Post,Integer> implements PostDao{
    public List<Post> findAll() {
        Query query = null;
        query = entityManager.createQuery("select u from Post u", Post.class);

        List<Post> post = null;
        try {
            post =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return post;
    }

    @Override
    public List<Post> findPostChilds(Integer id,Integer lastestId) {
        Query query = null;
        if(lastestId==0) {
            query = entityManager.createQuery("select u from Post u where u.parentId =:id order by u.id desc", Post.class);
            query.setParameter("id", id);
        } else {
            query = entityManager.createQuery("select u from Post u where u.parentId =:id and u.id < :lastestId order by u.id desc", Post.class);
            query.setParameter("id", id);
            query.setParameter("lastestId",lastestId);
        }
        query.setMaxResults(Constant.NUMBER_PAGE+1);
        List<Post> posts = null;
        try {
            posts =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return posts;
    }

    @Override
    public List<Post> findQuestionsByOwnerUser(User ownerUser){
        Query query = entityManager.createQuery("Select p from Post  p where p.parentId=0 and p.postType=1 " +
                "and p.ownerUserId=:ownerUser");
        query.setParameter("ownerUser", ownerUser);
        List<Post> questions = null;
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public List<Post> findArticlesByOwnerUser(User ownerUser) {
        Query query = entityManager.createQuery("Select p from Post  p where p.parentId=0 and p.postType=2 " +
                "and p.ownerUserId=:ownerUser");
        query.setParameter("ownerUser", ownerUser);
        List<Post> articles = null;
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public List<Post> findRepliesByParentId(Integer parentId) {
        Query query = entityManager.createQuery("Select p from Post p where p.parentId=:parentId");
        query.setParameter("parentId",parentId);
        List<Post> replies = null;
        try {
            replies = query.getResultList();
        } catch (NoResultException e){

        }
        return replies;
    }

    @Override
    public List<Post> findQuestionByOwnerClassroom(Classroom ownerClassroom) {
        Query query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                " p.ownerClassId=:ownerClassroom",Post.class);
        query.setParameter("ownerClassroom",ownerClassroom);
        List<Post> questions = null;
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public List<Post> findArticleByOwnerClassroom(Classroom ownerClassroom) {
        Query query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                " p.ownerClassId=:ownerClassroom order by  p.id  ",Post.class);
        query.setParameter("ownerClassroom",ownerClassroom);
        List<Post> articles = null;
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public List<Post> findQuestionByOwnerClassroom(Integer classroomId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerClassId.id=:classroomId order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerClassId.id=:classroomId and p.id<:lastId order by p.id desc");
            query.setParameter("lastId",lastId);
        }

        query.setParameter("classroomId",classroomId);
        List<Post> questions = null;
        query.setMaxResults(11);
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public List<Post> findQuestionByOwnerClassroomLikeTitle(Integer classroomId, String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerClassId.id=:classroomId and p.title LIKE :searchKey order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerClassId.id=:classroomId and p.title LIKE :searchKey and p.id<:lastId order by p.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        List<Post> questions = null;
        query.setMaxResults(11);
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public Integer countQuestionByOwnerClassroomLikeTitle(Integer classroomId, String searchKey) {
        Query query = entityManager.createQuery("Select COUNT(p.id) from Post p where p.postType=1 " +
                "and p.ownerClassId.id=:classroomId and p.title LIKE :searchKey");
        query.setParameter("classroomId",classroomId);
        query.setParameter("searchKey",'%' + searchKey + '%');
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<Post> findArticleByOwnerClassroom(Integer classroomId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerClassId.id=:classroomId order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerClassId.id=:classroomId and p.id<:lastId order by p.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("classroomId",classroomId);
        List<Post> articles = null;
        query.setMaxResults(11);
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public List<Post> findArticleByOwnerClassroomLikeTitle(Integer classroomId, String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerClassId.id=:classroomId and p.title LIKE :searchKey order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerClassId.id=:classroomId and p.title LIKE :searchKey and p.id<:lastId order by p.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setParameter("classroomId",classroomId);
        List<Post> questions = null;
        query.setMaxResults(11);
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public Integer countArticleByOwnerClassroomLikeTitle(Integer classroomId, String searchKey) {
        Query query = entityManager.createQuery("Select COUNT(p.id) from Post p where p.postType=2 " +
                "and p.ownerClassId.id=:classroomId and p.title LIKE :searchKey");
        query.setParameter("classroomId",classroomId);
        query.setParameter("searchKey",'%' + searchKey + '%');
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<Post> findArticleByCategory(Integer categoryId, Integer nextFrom) {
        Query query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                " p.ownerClassId.categoryId.id=:categoryId order by p.id desc");
        query.setParameter("categoryId",categoryId);
        List<Post> articles = null;
        if (nextFrom < 0) {
            nextFrom = 0;
        }
        query.setFirstResult(nextFrom);
        query.setMaxResults(11);
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public List<Post> findQuestionsByOwnerUser(Integer ownerUserId, Integer lastId) {
        Query query;
        if (lastId==0) {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerUserId.id=:ownerUserId order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.ownerUserId.id=:ownerUserId and p.id<:lastId order by p.id desc");

            query.setParameter("lastId", lastId);
        }
        query.setParameter("ownerUserId",ownerUserId);
        List<Post> questions = null;
        query.setMaxResults(11);
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public List<Post> findArticlesByOwnerUser(Integer ownerUserId, Integer lastId) {
        Query query;
        if (lastId==0) {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerUserId.id=:ownerUserId order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.ownerUserId.id=:ownerUserId and p.id<:lastId order by p.id desc");

            query.setParameter("lastId", lastId);
        }
        query.setParameter("ownerUserId",ownerUserId);
        List<Post> articles = null;
        query.setMaxResults(11);
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public List<Post> findQuestionLikeTitle(String searchKey, Integer lastId) {
        Query query;
        if (lastId==0) {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.title LIKE :searchKey order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=1 and" +
                    " p.title LIKE :searchKey and p.id<:lastId order by p.id desc");

            query.setParameter("lastId", lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        List<Post> questions = null;
        query.setMaxResults(11);
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public Integer countQuestionLikeTitle(String searchKey) {
        Query query = entityManager.createQuery("Select COUNT(p.id) from Post p where p.postType=1 and" +
                    " p.title LIKE :searchKey");

        query.setParameter("searchKey",'%' + searchKey + '%');
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<Post> findArticleLikeTitle(String searchKey, Integer lastId) {
        Query query;
        if (lastId==0) {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.title LIKE :searchKey order by p.id desc");
        } else {
            query = entityManager.createQuery("Select p from Post p where p.postType=2 and" +
                    " p.title LIKE :searchKey and p.id<:lastId order by p.id desc");

            query.setParameter("lastId", lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        List<Post> articles = null;
        query.setMaxResults(11);
        try {
            articles = query.getResultList();
        } catch (NoResultException e){

        }
        return articles;
    }

    @Override
    public Integer countArticleLikeTitle(String searchKey) {
        Query query = entityManager.createQuery("Select COUNT(p.id) from Post p where p.postType=2 and" +
                " p.title LIKE :searchKey");

        query.setParameter("searchKey",'%' + searchKey + '%');
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<PostDto> loadMoreAnswer(Integer id, Integer page) {
        List<PostDto> postDtos = new ArrayList<PostDto>();
        List<Post> posts = findPostChilds(id,page);
        for (int i = 0; i < posts.size()  ; i++) {
            PostDto postDto = ConvertEntityDto.convertPostEntityToDto(posts.get(i));
            postDtos.add(postDto);
        }
        return postDtos;
    }

    @Override
    public Post findLastCreatedPostByOwner(User ownerUser) {
        Query query = entityManager.createQuery("Select p from Post  p where p.parentId=0 " +
                "and p.ownerUserId=:ownerUser order by p.id desc");
        query.setParameter("ownerUser", ownerUser);
        query.setMaxResults(1);
        Post post = null;
        try {
            post = (Post) query.getResultList().get(0);
        } catch (NoResultException e){

        }
        return post;
    }

    @Override
    public Post findLastCreatedReplyByOwner(User ownerUser) {
        Query query = entityManager.createQuery("Select p from Post  p where p.parentId>0 " +
                "and p.ownerUserId=:ownerUser order by p.id desc");
        query.setParameter("ownerUser", ownerUser);
        query.setMaxResults(1);
        Post reply = null;
        try {
            reply = (Post) query.getResultList().get(0);
        } catch (NoResultException e){

        }
        return reply;
    }

    @Override
    public List<Post> findRepliesWasAcceptedByParentId(Integer parentId) {
        List<Post> posts = null;
        Query query = entityManager.createQuery("Select p from Post p where p.parentId=:parentId and p.acceptedAnswerId=:accept");
        query.setParameter("accept",Constant.ACCEPT_ANSWER);
        query.setParameter("parentId",parentId);
        try {
            posts = query.getResultList();
        } catch (NoResultException e){
            System.out.println("No post was accepted");
        }
        return posts;
    }
    @Override
    public List<PostDto> listSuggestPost(String title) {
        List<Post> posts = null;
        Query query = entityManager.createNativeQuery("SELECT * FROM post WHERE MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE) " +
                "order by MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE)  desc limit 30",Post.class);
        query.setParameter(new Integer(1),title);
        query.setParameter(new Integer(2),title);
        try {
            posts = query.getResultList();
        } catch (NoResultException e){
            System.out.println("No post was accepted");
        }
        List<PostDto> postDtos = null;
        if(posts!=null) {
            postDtos = new ArrayList<PostDto>();
            for(int i = 0 ; i < posts.size();i++) {
                postDtos.add(ConvertEntityDto.convertPostEntityToDto(posts.get(i)));
            }
        }
        return postDtos;
    }
    @Override
    public List<Post> listQuestionMerge(Integer id,Double range) {
        List<Post> posts = null;
        Query query = entityManager.createQuery("select p from Post p where p.status=1 and p.acceptedAnswerId=0 and p.parentId=0 and p.postType=1 and p.ownerClassId.id=:id",Post.class);
        query.setParameter("id",id);
        try {
            posts = query.getResultList();
        } catch (NoResultException e){
            System.out.println("No post was accepted");
        }
        if(posts!=null) {
                Jaccard nGram = new Jaccard(4);
            for(int i = 0 ; i < posts.size();i++) {
                Integer flag = 0 ;
                Post post = posts.get(i);
                for(int j = 0 ; j < posts.size() ; j++) {
                    Double score = nGram.distance(post.getTitle(),posts.get(j).getTitle());
                    if(score >= range) {
                        flag++;
                    }
                    score = score + post.getScore();
                    post.setScore(score);
                }
                if(flag == 1) {
                    post.setScore(0.0);
                }
            }
            Collections.sort(posts, new Comparator<Post>() {
                @Override
                public int compare(Post post, Post post2) {
                    if(post.getScore()==post2.getScore()) {
                        return 0;
                    } else if(post.getScore() > post2.getScore()) {
                        return 1;
                    } else {
                        return -1;
                    }
                }
            });
        }

        return posts;
    }

    @Override
    public List<Post> findRelatedQuestion(String title) {
        List<Post> posts = null;
        Query query = entityManager.createNativeQuery("SELECT * FROM post " +
                "WHERE MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE) AND PostType=1 limit 30",Post.class);
        query.setParameter(new Integer(1),title);
        try {
            posts = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return posts;
    }

    @Override
    public List<Post> findRelatedArticle(String title) {
        List<Post> posts = null;
        Query query = entityManager.createNativeQuery("SELECT * FROM post " +
                "WHERE MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE) AND PostType=2 limit 30",Post.class);
        query.setParameter(new Integer(1),title);
        try {
            posts = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return posts;
    }

    @Override
    public Integer countAnswers(Integer postId) {
        Query query = entityManager.createQuery("Select COUNT(p.id) from Post p where p.postType=3 and" +
                " p.parentId =:postId");
        query.setParameter("postId",postId);
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public Integer countSimilar(String title,Integer classroomId) {
        Query query = entityManager.createNativeQuery("Select COUNT(p.id) from Post p where p.OwnerClassId = ? and p.postType=1 and p.status=1 and p.isAccepted=0 and " +
                "MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE) > 2");
        query.setParameter(new Integer(1),classroomId);
        query.setParameter(new Integer(2),title);
        Integer count = 0;
        try {
            count = ((BigInteger) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }

    @Override
    public List<Post> listQuestionMerge(String title,Integer classroomId) {
        List<Post> posts = null;
        Query query = entityManager.createNativeQuery("Select * from Post p where p.OwnerClassId = ? and p.postType=1 and p.status=1 and p.isAccepted=0 and " +
                "MATCH (Title) AGAINST (? IN NATURAL LANGUAGE MODE) > 2",Post.class);
        query.setParameter(new Integer(1),classroomId);
        query.setParameter(new Integer(2),title);
        try {
            posts = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("Result null");
        }
        return posts;
    }
}
