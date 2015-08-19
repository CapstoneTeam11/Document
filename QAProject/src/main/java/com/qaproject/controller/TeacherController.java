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
import com.qaproject.util.NewsFeedUtilities;
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
    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    @RequestMapping(value = "/followTeacher/",method = RequestMethod.POST)
    @ResponseBody
    public String followTeacher(@RequestParam(value = "teacherId")Integer teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = new Follower();
        follower.setFollowerId(user);
        follower.setTeacherId(new User(teacherId));
        try {
            followerDao.persist(follower);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/unfollowTeacher/",method = RequestMethod.POST)
    @ResponseBody
    public String unfollowTeacher(Model model, @RequestParam(value = "teacherId")Integer teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = followerDao.findByTeacherId(teacherId, user);
        try {
            followerDao.delete(follower);
            newsFeedUtilities.removeQuestionsOfFollowedTeacher(user.getId(),teacherId);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/teacherdashboard",method = RequestMethod.GET)
        public String teacherdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("currentPage","redirect:/dashboard");
            return "redirect:/";
        }
        if(user.getRoleId().getId()==1){
            return "403";
        }
        //check if teacher have any post or following others
        List<ClassroomDto> ownedClassrooms = dashboardUtilities.loadOwnedClassrooms(user.getId(), 0);
        Integer lastOwnedClassroomId = 0;
        if (ownedClassrooms!=null) {
            if (ownedClassrooms.size()>10){
                lastOwnedClassroomId = ownedClassrooms.get(ownedClassrooms.size()-2).getId();
            }
        }
        List<FollowerDto> followedTeachers = dashboardUtilities.loadFollowedTeachers(user.getId(), 0);
        Integer lastFollowedTeacherId = 0;
        if (followedTeachers!=null) {
            if (followedTeachers.size()>10){
                lastFollowedTeacherId = followedTeachers.get(followedTeachers.size()-2).getId();
            }
        }

        List<PostInvitationDto> invitations = dashboardUtilities.loadPostInvitations(user.getId(), 0);
        Integer lastPostInvitationId = 0;
        if (invitations!=null){
            if (invitations.size()>10){
                lastPostInvitationId = invitations.get(invitations.size()-2).getId();
            }
        }

        model.addAttribute("invitations",invitations);
        model.addAttribute("lastPostInvitationId",lastPostInvitationId);
        model.addAttribute("ownedClassrooms",ownedClassrooms);
        model.addAttribute("lastOwnedClassroomId",lastOwnedClassroomId);
        model.addAttribute("followedTeachers",followedTeachers);
        model.addAttribute("lastFollowedTeacherId", lastFollowedTeacherId);
        if (ownedClassrooms.size()==0 && followedTeachers.size()==0 && invitations.size()==0) {
            return "teacherdashboardWelcome";
        }
        return "teacherdashboard";
    }
}
