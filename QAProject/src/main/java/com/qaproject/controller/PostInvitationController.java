package com.qaproject.controller;

import com.qaproject.dao.NotificationDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dto.NotificationDto;
import com.qaproject.entity.Notification;
import com.qaproject.entity.Post;
import com.qaproject.entity.PostInvitation;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import com.qaproject.util.NotificationUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/10/2015.
 */
@Controller
public class PostInvitationController {

    @Autowired
    PostInvitationDao postInvitationDao;

    @Autowired
    UserDao userDao;

    @Autowired
    PostDao postDao;

    @Autowired
    HttpSession session;

    @Autowired
    NotificationUtilities notificationUtilities;

    @Autowired
    NotificationDao notificationDao;

    @Autowired
    SimpMessagingTemplate template;

    @RequestMapping(value = "/teacherInvitation",method = RequestMethod.POST)
    public String teacherInvitation(@RequestParam List<Integer> userId,
                                    @RequestParam("postId") Integer postId) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage","redirect:/post/view/"+postId);
            return "redirect:/";
        }

        Post post = postDao.find(postId);
        for (int i = 0; i < userId.size(); i++) {
            User teacher = userDao.find(userId.get(i));
            PostInvitation postInvitation = new PostInvitation();
            postInvitation.setPostId(post);
            postInvitation.setTeacherId(teacher);
            postInvitationDao.persist(postInvitation);
            Notification notification = new Notification();
            notification.setReceiverId(teacher);
            notification.setSenderId(user);
            notification.setObjectId(post.getId());
            notification.setNotificationType(Constant.NT_INVITE_TO_ANSWER_POST);
            notification.setIsViewed(Constant.IV_FALSE);
            notificationDao.persist(notification);
            NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification, notification.getNotificationType(), post);
            template.convertAndSend("/topic/notice/" + teacher.getId(), notificationDto);
        }
        return "redirect:/post/view/"+postId;
    }

    @RequestMapping(value = "/removeInvitation",method = RequestMethod.POST)
    @ResponseBody
    public String removeInvitation(@RequestParam Integer invitationId) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "NG";
        }
        PostInvitation postInvitation = postInvitationDao.find(invitationId);
        try {
            postInvitationDao.delete(postInvitation);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
}
