package com.qaproject.controller;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dto.FollowerDto;
import com.qaproject.entity.User;
import com.qaproject.util.DashboardUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Minh on 6/21/2015.
 */
@Controller
public class FollowerController {
    @Autowired
    DashboardUtilities dashboardUtilities;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "dashboard/followedTeacher/{lastId}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<FollowerDto> loadFollowedTeacher(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        if (user==null) {
            return null;
        }
        List<FollowerDto> followerDtos = null;
        try {
            followerDtos = dashboardUtilities.loadFollowedTeachers(user.getId(),lastId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return followerDtos;
    }
}
