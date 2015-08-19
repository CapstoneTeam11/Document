package com.qaproject.dao;

import com.qaproject.entity.Notification;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface NotificationDao {
    public Notification find(Integer id);
    List<Notification> findAll();
    List<Notification> findByUserId(Integer userId);
    List<Notification> findByUserUnview(Integer userId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void setAllView(Integer userId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void markAllRead(Integer userId);
    Integer getNumberUnview(Integer userId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Notification entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Notification entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Notification entity);
}
