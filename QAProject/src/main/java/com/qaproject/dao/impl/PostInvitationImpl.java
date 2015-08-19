package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.entity.PostInvitation;
import com.qaproject.util.Constant;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public class PostInvitationImpl extends BaseDao<PostInvitation,Integer> implements PostInvitationDao {

    @Override
    public List<PostInvitation> findLastInvitationsByTeachers(List<Integer> teacherIds) {
        List<PostInvitation> postInvitations = null;
        Query query = entityManager.createQuery("Select pi from PostInvitation pi where pi.teacherId.id in :teacherIds");
        query.setParameter("teacherIds",teacherIds);
        try {
            postInvitations = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return postInvitations;
    }

    @Override
    public List<PostInvitation> findPostInvitationForDashboard(Integer teacherId, Integer lastId) {
        List<PostInvitation> postInvitations = null;
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select pi from PostInvitation pi where pi.teacherId.id=:teacherId " +
                    "order by pi.id desc");
        }else {
            query = entityManager.createQuery("Select pi from PostInvitation pi where pi.teacherId.id=:teacherId " +
                    "and pi.id<:lastId order by pi.id desc");
            query.setParameter("lastId",lastId);
        }

        query.setParameter("teacherId",teacherId);
        query.setMaxResults(11);
        try {
            postInvitations = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return postInvitations;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(PostInvitation entity) {
        PostInvitation postInvitation = entityManager.getReference(PostInvitation.class, entity.getId());
        entityManager.remove(postInvitation);
    }
}
