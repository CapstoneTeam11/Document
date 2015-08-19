package com.qaproject.dao;

import com.qaproject.entity.TagClassroom;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface TagClassroomDao {
    public TagClassroom find(Integer id);
    List<TagClassroom> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(TagClassroom entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(TagClassroom entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(TagClassroom entity);
}
