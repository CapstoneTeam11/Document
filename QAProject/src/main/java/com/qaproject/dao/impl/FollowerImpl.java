package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.FollowerDao;
import com.qaproject.dto.FollowerDto;
import com.qaproject.entity.Follower;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public class FollowerImpl extends BaseDao<Follower,Integer> implements FollowerDao {
    @Override
    public Follower findByTeacherId(Integer teacherId, User studentId) {
        Query query = null;
        query = entityManager.createQuery("select f from Follower f where f.teacherId.id = :teacherId and f.followerId.id = :studentId", Follower.class);
        List<Follower> followers = null;
        try {
            query.setParameter("teacherId", teacherId);
            query.setParameter("studentId", studentId.getId());
            followers =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return followers.size()>0?followers.get(0):null;
    }

    @Override
    public List<Follower> findByFollower(User user) {
        Query query = entityManager.createQuery("Select f from Follower f where f.followerId=:user");
        query.setParameter("user",user);
        List<Follower> followedTeachers = null;
        try{
            followedTeachers = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return followedTeachers;
    }

    @Override
    public List<Follower> findByTeacher(Integer teacherId) {
        Query query = entityManager.createQuery("Select f from Follower f where f.teacherId.id=:teacherId");
        query.setParameter("teacherId",teacherId);
        List<Follower> followers = null;
        try{
            followers = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return followers;
    }

    @Override
    public List<Follower> findFollowedTeacherForDashboard(Integer followerId, Integer lastId) {
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select f from Follower f where f.followerId.id=:followerId " +
                    "order by f.id desc");
        } else {
            query = entityManager.createQuery("Select f from Follower f where f.followerId.id=:followerId " +
                    "and f.id<:lastId order by f.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("followerId",followerId);
        query.setMaxResults(11);
        List<Follower> followers = null;
        try{
            followers = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return followers;
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(Follower entity) {
        Follower follower = entityManager.getReference(Follower.class, entity.getId());
        entityManager.remove(follower);
    }
}
