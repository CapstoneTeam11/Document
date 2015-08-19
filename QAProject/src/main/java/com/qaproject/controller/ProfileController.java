package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.*;
import com.qaproject.util.ProfileUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/19/2015.
 */
@Controller
public class ProfileController {
    @Autowired
    UserDao userDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    PostDao postDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    HttpSession session;
    @Autowired
    ProfileUtilities profileUtilities;


    @RequestMapping(value = "/profile/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        boolean isFollow = false;
        User user = (User)session.getAttribute("user");
        if (user==null) {
            session.setAttribute("currentPage","redirect:/profile/view/"+id);
            return "redirect:/";
        }

        User userProfile = userDao.find(id);
        if (userProfile==null) {
            return "404";
        }
        if (userProfile.getRoleId().getId()==2){ //if userProfile is teacher
            List<Follower> followedTeachers = followerDao.findByFollower(user);
            for (Follower followedTeacher:followedTeachers) {
                if (followedTeacher.getTeacherId().equals(userProfile)){
                    isFollow = true;
                }
            }
        }
        Integer userProfileId = userProfile.getId();
        List<PostDto> questions = profileUtilities.loadProfileQuestions(userProfileId,0);
        Integer lastQuestionId=0;
        if (questions!=null) {
            if (questions.size()>10){
                lastQuestionId = questions.get(questions.size()-2).getId();
            }
        }
        List<PostDto> articles = profileUtilities.loadProfileArticles(userProfileId, 0);
        Integer lastArticleId=0;
        if (articles!=null) {
            if (articles.size()>10){
                lastArticleId = articles.get(articles.size()-2).getId();
            }
        }

        Integer lastClassroomId=0;
        List<ClassroomDto> classrooms = new ArrayList<ClassroomDto>();
        if (userProfile.getRoleId().getId()==1){ // if user is student, find joined classrooms
            classrooms = profileUtilities.loadJoinedClassrooms(userProfileId,0);
            if (classrooms!=null) {
                if (classrooms.size()>10){
                    lastClassroomId = classrooms.get(classrooms.size()-2).getJoinedId();
                }
            }
        }
        if (userProfile.getRoleId().getId()==2){ // if user is teacher, find owner classrooms
            classrooms = profileUtilities.loadOwnedClassrooms(userProfileId,0);
            if (classrooms!=null) {
                if (classrooms.size()>10){
                    lastClassroomId = classrooms.get(classrooms.size()-2).getId();
                }
            }
        }


        model.addAttribute("questionCount", (questions!=null) ? questions.size():0);
        model.addAttribute("articleCount", (articles!=null) ? articles.size():0);
        model.addAttribute("classroomCount", (classrooms!=null) ? classrooms.size():0);
        model.addAttribute("questions",questions);
        model.addAttribute("lastQuestionId",lastQuestionId);
        model.addAttribute("articles",articles);
        model.addAttribute("lastArticleId",lastArticleId);
        model.addAttribute("classrooms",classrooms);
        model.addAttribute("lastClassroomId",lastClassroomId);
        model.addAttribute("isFollow",isFollow);
        model.addAttribute("userProfile", userProfile);

        return "profile";
    }

    @RequestMapping(value = "/profile/question",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreQuestion(@RequestParam Integer userProfileId, @RequestParam Integer lastId) {
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        try {
            questionDtos = profileUtilities.loadProfileQuestions(userProfileId,lastId);
        } catch (Exception e){

        }
        return questionDtos;
    }

    @RequestMapping(value = "/profile/article",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreArticle(@RequestParam Integer userProfileId, @RequestParam Integer lastId) {
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        try {
            articleDtos = profileUtilities.loadProfileArticles(userProfileId, lastId);
        } catch (Exception e){

        }
        return articleDtos;
    }

    @RequestMapping(value = "/profile/joinedClassroom",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<ClassroomDto> loadMoreJoinedClassroom(@RequestParam Integer userProfileId, @RequestParam Integer lastId) {
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        try {
            classroomDtos = profileUtilities.loadJoinedClassrooms(userProfileId, lastId);
        } catch (Exception e){

        }
        return classroomDtos;
    }

    @RequestMapping(value = "/profile/ownedClassroom",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<ClassroomDto> loadMoreOwnedClassroom(@RequestParam Integer userProfileId,
                                                   @RequestParam Integer lastId) {
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        try {
            classroomDtos = profileUtilities.loadOwnedClassrooms(userProfileId, lastId);
        } catch (Exception e){

        }
        return classroomDtos;
    }
}
