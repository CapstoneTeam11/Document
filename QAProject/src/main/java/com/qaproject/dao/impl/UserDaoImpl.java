package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import org.springframework.stereotype.Repository;

import javax.jws.soap.SOAPBinding;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class UserDaoImpl extends BaseDao<User,Integer> implements UserDao {
    @Override
    public List<User> login(String username, String password) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email = :username and u.password = :password", User.class);
        List<User> users = null;
        try {
            query.setParameter("username", username);
            query.setParameter("password", password);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public User find(String name) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email like :username", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", "%" +name+ "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users.size()>0?users.get(0):null;
    }
    @Override
    public User findByEmail(String name) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email = :username", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", name);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users.size()>0?users.get(0):null;
    }

    @Override
    public List<User> findAllStudentNotInClass(int classId, String username) {
        Query query = null;
        query = entityManager.createQuery("select u from User u " +
                "where u.id not in(select  cu.userId.id from ClassroomUser  cu where" +
                " cu.classroomId.id = :classId) and u.displayName like :username and u.roleId.id = 1 and u.status = 0", User.class);

        List<User> users = null;
        try {
            query.setParameter("classId", classId);
            query.setParameter("username", "%" + username + "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public List<User> findAllStudent(String username) {
        Query query = null;
        query = entityManager.createQuery("select u from User u " +
                "where u.displayName like :username and u.roleId.id = 1 and u.status = 0", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", "%" + username + "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public List<User> findTeacherPostInvitation(String username,Integer postId) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.displayName like :username and u.roleId.id = 2 and u.status = 0 and u not in (select p.teacherId from PostInvitation p where p.postId.id =:postId ) ", User.class);
        List<User> users = null;
        try {
            query.setParameter("username", "%" + username + "%");
            query.setParameter("postId",postId);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }
    @Override
    public List<User> findUserNotificationByPost(Integer postId) {
        Query query = null;
        query = entityManager.createQuery("select distinct (u) from User u where u.id in (select p.ownerUserId from Post p where p.parentId=:postId) or u.id in (select w.userId from WantAnswerPost w where w.postId.id=:postId ) or u.id in (select p.ownerUserId from Post p where p.id=:postId)", User.class);
        List<User> users = null;
        try {
            query.setParameter("postId",postId);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }
    @Override
    public List<User> findUserNotificationByCreatePostTeacher(Integer teacherId,Integer classId) {
        Query query = null;
        query = entityManager.createQuery("select distinct (u) from User u where u.id in (select c.userId from ClassroomUser c where c.classroomId.id=:classId and c.approval=1) or " +
                                          "u.id in (select f.followerId from Follower f where f.teacherId.id=:teacherId)", User.class);
        List<User> users = null;
        try {
            query.setParameter("classId",classId);
            query.setParameter("teacherId",teacherId);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public List<User> findUserLikeDisplayName(String searchKey, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select u from User u where u.displayName like :searchKey " +
                    "order by u.id desc ");
        } else {
            query = entityManager.createQuery("Select u from User u where u.displayName like :searchKey " +
                    "and u.id<:lastId order by u.id desc ");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("searchKey",'%' + searchKey + '%');
        query.setMaxResults(11);
        List<User> users = null;
        try{
            users = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return users;
    }
    @Override
    public List<User> findAllUser(int page) {
        Query query;
        query = entityManager.createQuery("select u from User u order by id asc", User.class);
        if (page < 1) {
            page = 1;
        }
        query.setFirstResult((page-1)* Constant.NUMBER_PAGE);
        query.setMaxResults(Constant.NUMBER_PAGE+1);
        return query.getResultList();
    }
    @Override
    public Integer findNumberAllUser() {
        Query query;
        query = entityManager.createQuery("select count(u) from User u");
        return ((Long)query.getSingleResult()).intValue();
    }

	@Override
    public Integer countUserLikeDisplayName(String searchKey) {
        Query query = entityManager.createQuery("Select Count(u.id) from User u where u.displayName like :searchKey");
        query.setParameter("searchKey",'%' + searchKey + '%');
        Integer count = 0;
        try {
            count = ((Long) query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return count;
    }
}
