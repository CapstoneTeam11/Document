package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.NotificationDao;
import com.qaproject.entity.Notification;
import com.qaproject.util.Constant;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class NotificationDaoImpl extends BaseDao<Notification,Integer> implements NotificationDao{
    @Override
    public List<Notification> findByUserId(Integer userId) {
        Query query = null;
        List<Notification> notifications = null;
        query = entityManager.createQuery("SELECT n from Notification n where n.receiverId.id =:userId order by id desc ");
        query.setParameter("userId",userId);
        query.setMaxResults(Constant.NUMBER_PAGE);
        try {
            notifications = query.getResultList();
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("User null");
        }
        return notifications;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void setAllView(Integer userId) {
        List<Notification> notifications = null;
        Query query = null;
        query = entityManager.createQuery("SELECT n from Notification n where n.receiverId.id =:userId order by id desc ");
        query.setParameter("userId",userId);
        query.setMaxResults(Constant.NUMBER_PAGE);
        try {
            notifications = query.getResultList();
            for(Notification notification : notifications) {
                notification.setIsViewed(1);
                entityManager.merge(notification);
            }
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("notification null");
        }
    }

    @Override
    public Integer getNumberUnview(Integer userId) {
        Query query = null;
        query = entityManager.createQuery("SELECT count(n) from Notification n where n.receiverId.id =:userId and n.isViewed=0 order by id desc ");
        query.setParameter("userId",userId);
        query.setMaxResults(Constant.NUMBER_PAGE);
        return ((Long)query.getSingleResult()).intValue();
    }

    @Override
    public List<Notification> findByUserUnview(Integer userId) {
        Query query = null;
        List<Notification> notifications = null;
        query = entityManager.createQuery("SELECT n from Notification n where n.receiverId.id =:userId and n.isViewed=0 order by id desc ");
        query.setParameter("userId", userId);
        try {
            notifications = query.getResultList();
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("User null");
        }
        return notifications;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void markAllRead(Integer userId) {
        List<Notification> notifications = null;
        Query query = null;
        query = entityManager.createQuery("SELECT n from Notification n where n.receiverId.id =:userId and n.isViewed=0 order by id desc ");
        query.setParameter("userId",userId);
        query.setMaxResults(Constant.NUMBER_PAGE);
        try {
            notifications = query.getResultList();
            for(Notification notification : notifications) {
                notification.setIsViewed(1);
                entityManager.merge(notification);
            }
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("notification null");
        }
    }
}
