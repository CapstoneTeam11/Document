package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.NotificationDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dto.NotificationDto;
import com.qaproject.entity.Notification;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/23/2015.
 */
@Controller
public class NotificationController {

    @Autowired
    NotificationDao notificationDao;

    @Autowired
    ClassroomDao classroomDao;

    @Autowired
    PostDao postDao;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/notification/{id}",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody
    List<NotificationDto> getListNotification(@PathVariable int id) {
        List<Notification> notifications = notificationDao.findByUserId(id);
        List<NotificationDto> notificationDtos = new ArrayList<NotificationDto>();
        for(int i = 0 ; i < notifications.size();i++) {
            Notification notification = notifications.get(i);
            if (notification.getNotificationType() == Constant.NT_TEACHER_CREATE_CLASS ||
                    notification.getNotificationType()  == Constant.NT_INVITE_TO_JOIN_CLASS
                    || notification.getNotificationType()  == Constant.NT_ACCEPT_TO_JOIN_CLASS ||
                    notification.getNotificationType()  == Constant.NT_REQUEST_TO_JOIN_CLASS) {

                Object object = classroomDao.find(notification.getObjectId());
                if(object!=null) {
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
                }
            } else {
                Object object = postDao.find(notification.getObjectId());
                if(object!=null) {
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
                }
            }
        }
        return notificationDtos;
    }
    @RequestMapping(value = "/notification/setview/{id}",method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody
    String setListNotification(@PathVariable int id) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "NG";
        }
        if(user.getId()!=id) {
            return "NG";
        }
        try {
            notificationDao.setAllView(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/notification/unview/{id}",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody
    Integer getNumberUnview(@PathVariable int id) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return 0;
        }
        if(user.getId()!=id) {
            return -1;
        }
        int numberUnview = 0;
        try {
            numberUnview =  notificationDao.getNumberUnview(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return numberUnview;
    }
    @RequestMapping(value = "/notification/all",method = RequestMethod.GET)
    public String getListUnview(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "403";
        }
        List<Notification> notifications = notificationDao.findByUserUnview(user.getId());
        List<NotificationDto> notificationDtos = new ArrayList<NotificationDto>();
        for(int i = 0 ; i < notifications.size();i++) {
            Notification notification = notifications.get(i);
            if (notification.getNotificationType() == Constant.NT_TEACHER_CREATE_CLASS ||
                    notification.getNotificationType()  == Constant.NT_INVITE_TO_JOIN_CLASS
                    || notification.getNotificationType()  == Constant.NT_ACCEPT_TO_JOIN_CLASS ||
                    notification.getNotificationType()  == Constant.NT_REQUEST_TO_JOIN_CLASS) {

                Object object = classroomDao.find(notification.getObjectId());
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
            } else {
                Object object = postDao.find(notification.getObjectId());
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
            }
        }
        model.addAttribute("notifications",notificationDtos);
        return "listNotificationUnread";
    }
    @RequestMapping(value = "/notification/mark/all",method = RequestMethod.POST)
    public String markAllRead(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "403";
        }
        notificationDao.markAllRead(user.getId());
        return "redirect:/newsfeed";
    }
}
