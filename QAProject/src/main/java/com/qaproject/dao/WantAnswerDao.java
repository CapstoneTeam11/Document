package com.qaproject.dao;

import com.qaproject.entity.Post;
import com.qaproject.entity.WantAnswerPost;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/13/2015.
 */
public interface WantAnswerDao {
    public WantAnswerPost find(Integer id);
    List<WantAnswerPost> findAll();
    Integer countWantAnswerByPost(Post post);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(WantAnswerPost entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(WantAnswerPost entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(WantAnswerPost entity);
}
