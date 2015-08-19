package com.qaproject.controller;

import com.qaproject.dao.CategoryDao;
import com.qaproject.dao.RoleDao;
import com.qaproject.dao.TagDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dao.impl.CategoryDaoImpl;
import com.qaproject.dao.impl.UserDaoImpl;
import com.qaproject.dto.ReturnObjectWithStatus;
import com.qaproject.dto.StudentDto;
import com.qaproject.dto.TeacherDto;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.*;
import com.qaproject.util.Constant;
import com.qaproject.util.NewsFeedUtilities;
import com.sun.javafx.sg.PGShape;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by TADUCTUNG on 31-May-15.
 */
@Controller
public class UserController {
    @Autowired
    UserDao userDao;
    @Autowired
    TagDao tagDao;
    @Autowired
    RoleDao roleDao;
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    HttpSession session;
    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    @RequestMapping(value = "/profile/update",method = RequestMethod.GET)
    public String editProfile(Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if(user == null){
            session.setAttribute("currentPage","redirect:/profile/update");
            return "redirect:/";
        }
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        model.addAttribute("user", user);
        return "editProfile";
    }
    @RequestMapping(value = "/profile/update",method = RequestMethod.POST)
    public String updateProfile(@RequestParam("displayName") String displayName,
                                @RequestParam("cate") Integer cate,
                                @RequestParam("aboutMe") String aboutMe,
                                @RequestParam String profileUrl,
                                @RequestParam(required = false) List<Integer> tagId,
                                @RequestParam String password,
                                @RequestParam(required = false) List<String> newTag,
                                HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if(user == null){
            session.setAttribute("currentPage","/profile/update");
            return "redirect:/";
        }
        user.setDisplayName(displayName);
        user.setCategoryId(categoryDao.find(cate));
        user.setAboutMe(aboutMe);
        user.setProfileImageURL(profileUrl);
        user.setPassword(password);
        List<TagUser> tagUsers = null;
        if(tagId!=null || newTag!=null) {
        tagUsers = new ArrayList<TagUser>();
        }
        if(tagId!=null) {
            for (int i = 0; i < tagId.size(); i++) {
                TagUser tagUser = new TagUser();
                tagUser.setUserId(user);
                tagUser.setTagId(tagDao.find(tagId.get(i)));
                tagUsers.add(tagUser);
            }
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagUser tagUser = new TagUser();
                tagUser.setUserId(user);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tag.setTagCount(0);
                tagDao.persist(tag);
                tagUser.setTagId(tag);
                tagUsers.add(tagUser);
            }
        }
        if(tagUsers!=null) {
            user.getTagUserList().clear();
            user.getTagUserList().addAll(tagUsers);
        }
        userDao.merge(user);
        session.setAttribute("user",userDao.find(user.getId()));
        return "redirect:/profile/update";
    }
    @RequestMapping(value = "/editProfileData",method = RequestMethod.POST)
    @ResponseBody
    public String editProfileData( @RequestParam("displayName") String displayName, @RequestParam("cate") String cate,
                                   @RequestParam("aboutMe") String aboutMe, Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        user.setCategoryId(new Category(Integer.parseInt(cate)));
        user.setAboutMe(aboutMe);
        user.setDisplayName(displayName);
        try {
            userDao.merge(user);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
//    @ResponseBody
    public String register(@RequestParam(value = "email") String email,
                                           @RequestParam(value = "password")String password,
                                           @RequestParam(value = "confirm_password")String confirmpassword,
                                           @RequestParam(value = "cate")String cate,
                                           @RequestParam(value = "role")String role,
                                           HttpServletRequest request) {

        User userCheck = userDao.findByEmail(email);
        if(userCheck != null){
            return "redirect:/";
        }
        User user = new User();
        user.setAboutMe("");
        user.setDisplayName(email.split("@")[0]);
        user.setEmail(email);
        user.setPassword(password);
        user.setProfileImageURL("http://hefty-stone.ospry.io/i5k3utcog5b/avatar.png");
        Category category = new Category();
        category.setId(Integer.parseInt(cate));
        user.setCategoryId(category);
        user.setStatus(0);
        user.setCreationDate(new Date());
        if(role.equalsIgnoreCase("student")){
           user.setRoleId(roleDao.find(1));
        }else{
            user.setRoleId(roleDao.find(2));
        }
        userDao.persist(user);
        session.setAttribute("user", user);
        newsFeedUtilities.setNewsFeedQuestionAfterRegister(user);
        return "redirect:/dashboard";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    @ResponseBody
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model, HttpServletRequest request){
        if (username == null || username.length() == 0 || password == null || password.length() == 0){
            return "invalidLogin";
        }
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "redirect:/newsfeed";
        }
        List<User> users = userDao.login(username, password);
        if(users.size() > 0 && users.get(0).getStatus()==1){
            model.addAttribute("banned","banned");
            return "invalidLogin";
        }else if(users.size() > 0){
            session.setAttribute("user", users.get(0));
            String currentPage = (String) session.getAttribute("currentPage");
            if(users.get(0).getRoleId().getId()==3) {
                return "redirect:/manage/1";
            }
            if (currentPage!=null) {
                return currentPage;
            }
            return "redirect:/newsfeed";

        } else {
            return "invalidLogin";
        }
    }

    /**
     *
     * @param classroomId: class id
     * @param username: student name to suggest email
     * @param response
     * @return list all student not in class
     */
    @RequestMapping(value = "/findAllStudentNotInClass/{id}/{username}",method = RequestMethod.GET)
    @ResponseBody
    public List<StudentDto> findAllStudentNotInClass(@PathVariable("id") String classroomId,@PathVariable("username") String username, HttpServletResponse response) {
        List<User> userList = userDao.findAllStudentNotInClass(Integer.parseInt(classroomId), username);
        List<StudentDto> userNameList = new ArrayList<StudentDto>();
        for (int i = 0; i < userList.size(); i++) {
            userNameList.add(new StudentDto(userList.get(i).getDisplayName(), userList.get(i).getId(),userList.get(i).getProfileImageURL()));
        }
        response.addHeader("Access-Control-Allow-Origin", "*");
        return userNameList;
    }
    @RequestMapping(value = "/findAllStudent/{username}",method = RequestMethod.GET)
    @ResponseBody
    public List<StudentDto> findAllStudent(@PathVariable("username") String username, HttpServletResponse response) {
        List<User> userList = userDao.findAllStudent(username);
        List<StudentDto> userNameList = new ArrayList<StudentDto>();
        for (int i = 0; i < userList.size(); i++) {
            userNameList.add(new StudentDto(userList.get(i).getDisplayName(), userList.get(i).getId(),userList.get(i).getProfileImageURL()));
        }
        response.addHeader("Access-Control-Allow-Origin", "*");
        return userNameList;
    }
    @RequestMapping(value = "/teacherInvitation/{username}/{postId}",method = RequestMethod.GET)
    @ResponseBody
    public List<TeacherDto> teacherInvitation(@PathVariable("username") String username,
                                              @PathVariable("postId") Integer postId
                                                , HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        int userId = 0;
        if(user!=null) {
           userId = user.getId();
        }
        List<User> userList = userDao.findTeacherPostInvitation(username,postId);
        List<TeacherDto> userNameList = new ArrayList<TeacherDto>();
        for (int i = 0; i < userList.size(); i++) {
            if(userId!=0) {
                if(userId!=userList.get(i).getId()) {
                    userNameList.add(new TeacherDto(userList.get(i).getId(), userList.get(i).getDisplayName(),userList.get(i).getProfileImageURL()));
                }
            } else {
                userNameList.add(new TeacherDto(userList.get(i).getId(), userList.get(i).getDisplayName(),userList.get(i).getProfileImageURL()));
            }
        }
        response.addHeader("Access-Control-Allow-Origin", "*");
        return userNameList;
    }
    @RequestMapping(value = "/getProfile",method = RequestMethod.GET)
    public String getProfile(Model model, HttpServletRequest request) {
        User user = (User)session.getAttribute("user");
        if(user == null){
            session.setAttribute("currentPage","redirect:/profile/update");
            return "redirect:/";
        }
        model.addAttribute("userProfile", user);
        return "profile";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model, HttpServletRequest request){
        if (session.getAttribute("user")!=null) {
            session.removeAttribute("user");
            session.removeAttribute("currentPage");
        }

        return "redirect:/";
    }
    @RequestMapping(value = "/getUserById",method = RequestMethod.POST)
    @ResponseBody
    public StudentDto studentdashboard(ModelMap model, HttpServletRequest request, @RequestParam(value = "id") String userId) {
        User user = userDao.find(Integer.parseInt(userId));
        StudentDto studentDto = new StudentDto();
        studentDto.setStudentId(user.getId());
        studentDto.setStudentName(user.getDisplayName());
        //studentDto.setImageStudent(user.getProfileImageURL());
        return studentDto;
    }
    @RequestMapping(value = "/manage/{page}",method = RequestMethod.GET)
    public String viewAll(@PathVariable Integer page,ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "403";
        }
        if(user.getRoleId().getId()!=3) {
            return "403";
        }
        List<User> users = userDao.findAllUser(page);
        List<Category> categories = categoryDao.findParent();
        int numberUser = userDao.findNumberAllUser();
        model.addAttribute("categories",categories);
        model.addAttribute("users",users);
        model.addAttribute("currentPage",page);
        model.addAttribute("maxpage",Math.ceil(numberUser * 1.0 / Constant.NUMBER_PAGE));
        return "manageUser";
    }

    @RequestMapping(value = "/manage/parent",method = RequestMethod.POST)
    public String createParentCategory(@RequestParam String name) {
        Category category = new Category();
        category.setCategoryName(name);
        category.setParentId(0);
        categoryDao.persist(category);
        return "redirect:/manage/1";
    }
    @RequestMapping(value = "/manage/child",method = RequestMethod.POST)
    public String createChildCategory(@RequestParam String name,@RequestParam Integer parentId) {
        Category category = new Category();
        category.setCategoryName(name);
        category.setParentId(parentId);
        categoryDao.persist(category);
        return "redirect:/manage/1";
    }


    @RequestMapping(value = "/manage/lock",method = RequestMethod.POST)
    public @ResponseBody  String lockUser(@RequestParam Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");

        if(user==null) {
            return "NG";
        }
        if(user.getRoleId().getId()!=3) {
            return "NG";
        }
        try {
            User userLock = userDao.find(id);
            userLock.setStatus(1);
            userDao.merge(userLock);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/manage/unlock",method = RequestMethod.POST)
    public @ResponseBody  String unlockUser(@RequestParam Integer id) {
        //authorize
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "NG";
        }
        if(user.getRoleId().getId()!=3) {
            return "NG";
        }
        try {
            User userLock = userDao.find(id);
            userLock.setStatus(0);
            userDao.merge(userLock);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }

}
