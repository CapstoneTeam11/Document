package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.NotificationDao;
import com.qaproject.entity.Notification;
import org.springframework.stereotype.Repository;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class NotificationDaoImpl extends BaseDao<Notification,Integer> implements NotificationDao{
}
