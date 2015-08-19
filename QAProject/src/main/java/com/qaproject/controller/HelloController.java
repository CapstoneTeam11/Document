package com.qaproject.controller;

import com.qaproject.dao.CategoryDao;
import com.qaproject.dao.impl.CategoryDaoImpl;
import com.qaproject.entity.Category;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/** **/
@Controller
public class HelloController {
    @Autowired
    HttpSession session;
//
//    @Autowired
//    SimpMessagingTemplate template;
//
//    @Autowired
//    SessionSubscribeEvent subscribeEvent;

//    private void updateAddUI(Post post) {
//        template.convertAndSend("/topic/addPost",post);
//    }
//
//    @MessageMapping("/addPost")
//    public void addStock(Post post) throws Exception {
//        updateAddUI(post);
//    }
    @Autowired
    CategoryDao categoryDao;
	@RequestMapping(value = "/",method = RequestMethod.GET)
     public String printWelcome(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "redirect:/newsfeed";
        }
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        return "welcome";
    }
    @RequestMapping(value = "/homepage",method = RequestMethod.GET)
    public String homepage(ModelMap model) {
    return "homepage";
}
    @RequestMapping(value = "/question",method = RequestMethod.GET)
    public String question(ModelMap model) {
        return "question";
    }
    @RequestMapping(value = "/article",method = RequestMethod.GET)
    public String article(ModelMap model) {
        return "article";
    }


//    @RequestMapping(value = "/studentdashboard",method = RequestMethod.GET)
//    public String studentdashboard(ModelMap model) {
//        return "studentdashboard";
//    }
//    @RequestMapping(value = "/teacherdashboard",method = RequestMethod.GET)
//    public String teacherdashboard(ModelMap model) {
//        return "teacherdashboard";
//    }
    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public String profile(ModelMap model) {
        return "profile";
    }
//    @RequestMapping(value = "/material",method = RequestMethod.GET)
//    public String material(ModelMap model) {
//        return "material";
//    }
    @RequestMapping(value = "/classroomWelcome",method = RequestMethod.GET)
    public String classroomWelcome(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==1){
            return "403";
        }
        return "classroomWelcome";
    }
    @RequestMapping(value = "/403",method = RequestMethod.GET)
    public String forbidden() {
        return "403";
    }
}