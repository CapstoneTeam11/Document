package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagUserDao;
import com.qaproject.entity.TagUser;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class TagUserDaoImpl extends BaseDao<TagUser,Integer> implements TagUserDao {
    @Override
    public List<TagUser> findTagByUser(User user) {
        Query query = entityManager.createQuery("Select tu from TagUser tu where tu.userId=:user");
        query.setParameter("user",user);
        List<TagUser> tagUsers = null;
        try {
            tagUsers = query.getResultList();
        } catch (NoResultException e){

        }
        return tagUsers;
    }
}
