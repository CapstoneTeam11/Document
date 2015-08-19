package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.WantAnswerDao;
import com.qaproject.entity.Post;
import com.qaproject.entity.WantAnswerPost;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 * Created by khangtnse60992 on 6/13/2015.
 */
@Repository
public class WantAnswerImpl extends BaseDao<WantAnswerPost,Integer> implements WantAnswerDao {
    @Override
    public Integer countWantAnswerByPost(Post post) {
        Query query = entityManager.createQuery("Select count(wap.id) from WantAnswerPost wap where wap.postId=:post");
        query.setParameter("post",post);
        try {
            return ((Number)query.getSingleResult()).intValue();
        } catch (NoResultException e){

        }
        return 0;
    }
}
