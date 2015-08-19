package com.qaproject.dao;

import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface UserDao {
    public User find(Integer id);
    public User find(String name);
    public User findByEmail(String name);
    List<User> findAll();
    public List<User> findTeacherPostInvitation(String name,Integer portId);
    public List<User> findAllStudentNotInClass(int classId, String username);
    public List<User> findAllStudent(String username);
    public List<User> findAllUser(int page);
    public Integer findNumberAllUser();
    public List<User> findUserNotificationByPost(Integer postId);
    public List<User> findUserNotificationByCreatePostTeacher(Integer teacherId,Integer classId);
    public List<User> findUserLikeDisplayName(String searchKey, Integer lastId);
    Integer countUserLikeDisplayName(String searchKey);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(User entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(User entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(User entity);
    public List<User> login(String username, String password);
}
