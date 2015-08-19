package com.qaproject.dao;

import com.qaproject.dto.FollowerDto;
import com.qaproject.entity.Follower;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public interface FollowerDao {
    public Follower find(Integer id);
    public Follower findByTeacherId(Integer teacherId, User StudentId);
    List<Follower> findAll();
    List<Follower> findByFollower(User user);
    List<Follower> findByTeacher(Integer teacherId);
    List<Follower> findFollowedTeacherForDashboard(Integer followerId, Integer lastId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Follower entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Follower entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Follower entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(Follower entity);
}
