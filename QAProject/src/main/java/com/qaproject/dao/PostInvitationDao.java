package com.qaproject.dao;

import com.qaproject.entity.PostInvitation;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public interface PostInvitationDao {
    public PostInvitation find(Integer id);
    List<PostInvitation> findAll();
    List<PostInvitation> findLastInvitationsByTeachers (List<Integer> teacherIds);
    List<PostInvitation> findPostInvitationForDashboard(Integer teacherId, Integer lastId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(PostInvitation entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(PostInvitation entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(PostInvitation entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(PostInvitation entity);
}
