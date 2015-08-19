package com.qaproject.controller;

import com.qaproject.dao.PostDao;
import com.qaproject.dao.impl.PostDaoImpl;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by TADUCTUNG on 01-Jun-15.
 */
@Controller
public class ArticleController {
    @Autowired
    PostDao postDao;
    @RequestMapping(value = "/getAllPost",method = RequestMethod.GET)
    public String loadPost(Model model) {
        List<Post> posts = postDao.findAll();
        model.addAttribute("posts", posts);
        return "newsfeed";
    }
}
