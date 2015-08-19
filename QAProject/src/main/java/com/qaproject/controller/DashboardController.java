package com.qaproject.controller;

import com.qaproject.dao.UserDao;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Minh on 6/12/2015.
 */
@Controller
public class DashboardController {
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/dashboard",method = RequestMethod.GET)
    public String editProfile(Model model, HttpServletRequest request) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("currentPage","redirect:/dashboard");
            return "redirect:/";
        }
        if (user.getRoleId().getId()==1) {
            return "forward:/studentdashboard";
        } else {
            return "forward:/teacherdashboard";
        }
    }
}
