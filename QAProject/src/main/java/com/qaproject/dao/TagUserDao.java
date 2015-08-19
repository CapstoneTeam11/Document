package com.qaproject.dao;

import com.qaproject.entity.TagUser;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface TagUserDao {
    public TagUser find(Integer id);
    List<TagUser> findAll();
    List<TagUser> findTagByUser(User user);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(TagUser entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(TagUser entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(TagUser entity);
}
