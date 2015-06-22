package com.qaproject.controller;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dao.impl.FollowerImpl;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.FollowerDto;
import com.qaproject.dto.PostInvitationDto;
import com.qaproject.entity.*;
import com.qaproject.util.DashboardUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by TADUCTUNG on 08-Jun-15.
 */
@Controller
public class TeacherController {
    @Autowired
    FollowerDao followerDao;
    @Autowired
    UserDao userDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    DashboardUtilities dashboardUtilities;

    @RequestMapping(value = "/followTeacher/",method = RequestMethod.GET)
    @ResponseBody
    public String followTeacher(Model model, @RequestParam(value = "teacherId")String teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = new Follower();
        follower.setFollowerId(user);
        follower.setTeacherId(new User(Integer.parseInt(teacherId)));
        try {
            followerDao.persist(follower);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/unfollowTeacher/",method = RequestMethod.GET)
    @ResponseBody
    public String unfollowTeacher(Model model, @RequestParam(value = "teacherId")String teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = followerDao.findByTeacherId(Integer.parseInt(teacherId), user);
        try {
            followerDao.delete(follower);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/teacherdashboard",method = RequestMethod.GET)
        public String teacherdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==1){
            return "403";
        }
        //check if teacher have any post or following others
        List<ClassroomDto> ownedClassrooms = dashboardUtilities.loadOwnedClassrooms(user.getId(), 1);
        List<FollowerDto> followedTeachers = dashboardUtilities.loadFollowedTeachers(user.getId(), 1);
        List<PostInvitationDto> invitations = dashboardUtilities.loadPostInvitations(user.getId(), 1);
        if (ownedClassrooms.size()==0 && followedTeachers.size()==0 && invitations.size()==0) {
            return "teacherdashboardWelcome";
        }
        model.addAttribute("invitations",invitations);
        model.addAttribute("ownedClassrooms",ownedClassrooms);
        model.addAttribute("followedTeachers",followedTeachers);
        return "teacherdashboard";
    }
}
