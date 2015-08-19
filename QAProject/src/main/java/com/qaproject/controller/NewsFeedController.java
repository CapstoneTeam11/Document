package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.*;
import com.qaproject.util.NewsFeedUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Minh on 6/10/2015.
 */
@Controller
public class NewsFeedController {
    @Autowired
    HttpSession session;
    @Autowired
    UserDao userDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostDao postDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    /**
     * MinhKH
     * Controller get suggested classrooms
     * @param model
     * @return String
     */
    @RequestMapping(value= "/newsfeed", method= RequestMethod.GET)
    public String newsFeedLoad(ModelMap model){
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:/";
        }
        User currentUser = userDao.find(user.getId());
        List<ClassroomUser> classroomUsers = classroomUserDao.findByUser(currentUser);
        boolean isJoined = false;
        // Check if user have joined class
        for (ClassroomUser classroomUser:classroomUsers) {
            if (classroomUser.getApproval()==1){
                isJoined=true;
            }
        }

        //get suggested classrooms
        Category category = user.getCategoryId();
        List<Classroom> suggestedClassrooms = classroomDao.findByCategory(category);

        //get suggested posts - materials
        List<PostDto> suggestedQuestions = newsFeedUtilities.loadNewsFeedQuestions(user.getId(), 1); //load by page
        List<PostDto> suggestedArticles = newsFeedUtilities.loadNewsFeedArticles(user.getId(), 0); //load by nextFrom
        List<MaterialDto> suggestedMaterials = newsFeedUtilities.loadNewsFeedMaterials(user.getId(),0);

        //Check if User is student
        if (user.getRoleId().getId()==1){
            if (!isJoined) {
                model.addAttribute("suggestedClassrooms",suggestedClassrooms);
            }
        }

        model.addAttribute("materials", suggestedMaterials);
        model.addAttribute("questions",suggestedQuestions);
        model.addAttribute("articles",suggestedArticles);
        return "newsfeed";
    }

    @RequestMapping(value = "newsFeed/question/{page}",produces = "application/json",method = RequestMethod.GET)
    public @ResponseBody
    List<PostDto> loadNewsFeedQuestion(@PathVariable Integer page) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return null;
        }
        List<PostDto> questionDtos = null;
        try {
            questionDtos = newsFeedUtilities.loadNewsFeedQuestions(user.getId(),page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questionDtos;
    }

    @RequestMapping(value = "newsFeed/article/{nextFrom}",produces = "application/json",method = RequestMethod.GET)
    public @ResponseBody
    List<PostDto> loadNewsFeedArticle(@PathVariable Integer nextFrom) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return null;
        }
        List<PostDto> articleDtos = null;
        try {
            articleDtos = newsFeedUtilities.loadNewsFeedArticles(user.getId(), nextFrom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return articleDtos;
    }

    @RequestMapping(value = "newsFeed/material/{nextFrom}",produces = "application/json",method = RequestMethod.GET)
    public @ResponseBody
    List<MaterialDto> loadNewsFeedMaterial(@PathVariable Integer nextFrom) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return null;
        }
        List<MaterialDto> materialDtos = null;
        try {
            materialDtos = newsFeedUtilities.loadNewsFeedMaterials(user.getId(), nextFrom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return materialDtos;
    }
}
