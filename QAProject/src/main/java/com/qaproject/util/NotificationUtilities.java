package com.qaproject.util;

import com.qaproject.dao.NotificationDao;
import com.qaproject.entity.Notification;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Minh on 6/24/2015.
 */
@Component
public class NotificationUtilities {
    @Autowired
    NotificationDao notificationDao;

    public boolean insertNotification(List<User> receivers, User sender,Integer objectId,
                                   Integer notificationType, Integer isView){
        if (receivers==null || sender==null || objectId ==null || notificationType==null || isView==null){
            return false;
        }
        for(User receiver:receivers) {
            if (receiver!=null) {
                Notification notification = new Notification();
                notification.setReceiverId(receiver);
                notification.setSenderId(sender);
                notification.setObjectId(objectId);
                notification.setNotificationType(notificationType);
                notification.setIsViewed(isView);
                notificationDao.persist(notification);
            }
        }
        return true;
    }

    public boolean insertNotification(User receiver, User sender,Integer objectId,
                                      Integer notificationType, Integer isView){
        if (receiver==null || sender==null || objectId ==null || notificationType==null || isView==null){
            return false;
        }
        Notification notification = new Notification();
        notification.setReceiverId(receiver);
        notification.setSenderId(sender);
        notification.setObjectId(objectId);
        notification.setNotificationType(notificationType);
        notification.setIsViewed(isView);
        notificationDao.persist(notification);
        return true;
    }

}
