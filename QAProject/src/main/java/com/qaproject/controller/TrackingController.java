package com.qaproject.controller;

import com.qaproject.dto.TagDto;
import com.qaproject.entity.User;
import com.qaproject.util.TrackingUtilities;
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
 * Created by Minh on 6/30/2015.
 */
@Controller
public class TrackingController {
    @Autowired
    TrackingUtilities trackingUtilities;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/tracking",method = RequestMethod.GET)
    public String tracking(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("currentPage","redirect:/tracking");
            return "redirect:/";
        }
        if(user.getRoleId().getId()==1) { //if user is student
            return "404";
        }
        return "tracking";
    }

    @RequestMapping(value = "/tracking/load", produces = "application/json",
            method = RequestMethod.POST)
    public
    @ResponseBody
    List<TagDto> loadPostInvitation() {
        User user = (User) session.getAttribute("user");
        List<TagDto> tagDtos = new ArrayList<TagDto>();
        try {
            tagDtos = trackingUtilities.loadTracking(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tagDtos;
    }
}
