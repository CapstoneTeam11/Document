package com.qaproject.controller;

import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.UserDto;
import com.qaproject.entity.User;
import com.qaproject.util.SearchUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 7/6/2015.
 */
@Controller
public class SearchController {
    @Autowired
    SearchUtilities searchUtilities;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String create(@RequestParam Integer filter,
                         @RequestParam String searchKey,
                         ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "redirect:/";
        }
        if (searchKey==null){
            searchKey="";
        }
        searchKey = searchKey.trim();
        if (searchKey.length()>255){
            searchKey = searchKey.substring(0,255);
        }
        List<PostDto> questions = new ArrayList<PostDto>();
        List<PostDto> articles = new ArrayList<PostDto>();
        List<MaterialDto> materials = new ArrayList<MaterialDto>();
        List<ClassroomDto> classrooms = new ArrayList<ClassroomDto>();
        List<UserDto> users = new ArrayList<UserDto>();
        Integer countQuestion = 0;
        Integer countArticle = 0;
        Integer countMaterial = 0;
        Integer countClassroom = 0;
        Integer countUser = 0;
        Integer countResult = 0;
        if (filter<0 || filter>5) {
            filter=0;
        }
        if (filter==0) {
//            if (searchKey==""){
//                return "redirect:/newsfeed";
//            }
            questions = searchUtilities.getTopThreeQuestions(searchKey);
            articles = searchUtilities.getTopThreeArticles(searchKey);
            materials = searchUtilities.getTopThreeMaterials(searchKey);
            classrooms = searchUtilities.getTopThreeClassrooms(searchKey);
            users = searchUtilities.getTopThreeUsers(searchKey);
            countQuestion = searchUtilities.countQuestion(searchKey);
            countArticle = searchUtilities.countArticle(searchKey);
            countMaterial = searchUtilities.countMaterial(searchKey);
            countClassroom = searchUtilities.countClassroom(searchKey);
            countUser = searchUtilities.countUser(searchKey);
        }
        if (filter==1) {
            questions = searchUtilities.getQuestions(searchKey,0);
            countResult = searchUtilities.countQuestion(searchKey);
            Integer lastQuestionId = 0;
            if (questions!=null) {
                if (questions.size()>10){
                    lastQuestionId = questions.get(questions.size()-2).getId();
                }
            }
            model.addAttribute("lastQuestionId",lastQuestionId);
        }
        if (filter==2) {
            articles = searchUtilities.getArticles(searchKey,0);
            countResult = searchUtilities.countArticle(searchKey);
            Integer lastArticleId = 0;
            if (articles!=null) {
                if (articles.size()>10){
                    lastArticleId = articles.get(articles.size()-2).getId();
                }
            }
            model.addAttribute("lastArticleId",lastArticleId);
        }
        if (filter==3) {
            materials = searchUtilities.getMaterials(searchKey,0);
            countResult = searchUtilities.countMaterial(searchKey);
            Integer lastMaterialId = 0;
            if (materials!=null) {
                if (materials.size()>10){
                    lastMaterialId = materials.get(materials.size()-2).getId();
                }
            }
            model.addAttribute("lastMaterialId",lastMaterialId);
        }
        if (filter==4) {
            classrooms = searchUtilities.getClassrooms(searchKey,0);
            countResult = searchUtilities.countClassroom(searchKey);
            Integer lastClassroomId = 0;
            if (classrooms!=null) {
                if (classrooms.size()>10){
                    lastClassroomId = classrooms.get(classrooms.size()-2).getId();
                }
            }
            model.addAttribute("lastClassroomId",lastClassroomId);
        }
        if (filter==5) {
            users = searchUtilities.getUsers(searchKey,0);
            countResult = searchUtilities.countUser(searchKey);
            Integer lastUserId = 0;
            if (users!=null) {
                if (users.size()>10){
                    lastUserId = users.get(users.size()-2).getId();
                }
            }
            model.addAttribute("lastUserId",lastUserId);
        }
        model.addAttribute("countResult",countResult);
        model.addAttribute("countQuestion",countQuestion);
        model.addAttribute("countArticle",countArticle);
        model.addAttribute("countMaterial",countMaterial);
        model.addAttribute("countClassroom",countClassroom);
        model.addAttribute("countUser",countUser);
        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("materials",materials);
        model.addAttribute("classrooms",classrooms);
        model.addAttribute("users",users);
        if (filter==0){
            return "searchResult";
        } else {
            return "searchFilter";
        }
    }

    @RequestMapping(value = "/search/question",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreQuestiont(@RequestParam String searchKey, @RequestParam Integer lastId) {
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        try {
            questionDtos = searchUtilities.getQuestions(searchKey, lastId);
        } catch (Exception e){

        }
        return questionDtos;
    }

    @RequestMapping(value = "/search/article",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreArticle(@RequestParam String searchKey, @RequestParam Integer lastId) {
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        try {
            articleDtos = searchUtilities.getArticles(searchKey, lastId);
        } catch (Exception e){

        }
        return articleDtos;
    }

    @RequestMapping(value = "/search/material",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<MaterialDto> loadMoreMaterial(@RequestParam String searchKey, @RequestParam Integer lastId) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        try {
            materialDtos = searchUtilities.getMaterials(searchKey, lastId);
        } catch (Exception e){

        }
        return materialDtos;
    }

    @RequestMapping(value = "/search/classroom",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<ClassroomDto> loadMoreClassroom(@RequestParam String searchKey, @RequestParam Integer lastId) {
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        try {
            classroomDtos = searchUtilities.getClassrooms(searchKey, lastId);
        } catch (Exception e){

        }
        return classroomDtos;
    }

    @RequestMapping(value = "/search/user",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<UserDto> loadMoreUser(@RequestParam String searchKey, @RequestParam Integer lastId) {
        List<UserDto> userDtos = new ArrayList<UserDto>();
        try {
            userDtos = searchUtilities.getUsers(searchKey, lastId);
        } catch (Exception e){

        }
        return userDtos;
    }
}
