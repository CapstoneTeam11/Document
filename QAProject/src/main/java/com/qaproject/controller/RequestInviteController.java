package com.qaproject.controller;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dto.ReturnObjectWithStatus;
import com.qaproject.dto.StudentDto;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import com.qaproject.util.ConvertEntityDto;
import com.qaproject.util.NewsFeedUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Minh on 6/10/2015.
 */
@Controller
public class RequestInviteController {
    @Autowired
    HttpSession session;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    /**
     * TungTD: handelClass function
     * @param type: type = 1: cancelJoinClass, type = 2: acceptInvitation, type =3: leaveClass
     * @param classId
     * @return
     */
    @RequestMapping(value = "/handleClass",method = RequestMethod.POST)
    @ResponseBody
    public ReturnObjectWithStatus leaveClass(@RequestParam Integer classId, @RequestParam Integer type) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }
        List<ClassroomUser> classroomUsers = classroomUserDao.findByUserClassroom(user.getId(), classId);
        ClassroomUser classroomUser = null;
        if(classroomUsers == null){
            return new ReturnObjectWithStatus("NG", classId);
        }
        classroomUser = classroomUsers.get(0);
        //Check current User is classroom's owner
        if(user.getId()!= classroomUser.getUserId().getId()) {
            return new ReturnObjectWithStatus("NG", classId); //not owner
        }


        if (classroomUser!=null) {
            if (type == 2){ //type = 2: acceptInvitation
                classroomUser.setApproval(1);
                classroomUserDao.merge(classroomUser);
            } else if (type == 3){ // type = 3: leaveClassroom
                classroomUserDao.delete(classroomUser);
            }
        }

        return new ReturnObjectWithStatus("OK", classId);
    }

    @RequestMapping(value = "/acceptInvitation",method = RequestMethod.POST)
    @ResponseBody
    public String acceptInvitation(@RequestParam Integer classroomId) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "NG";
        }
        ClassroomUser classroomUser = classroomUserDao.findClassroomByClassroomAndUser(user.getId(),classroomId);
        try {
            classroomUser.setApproval(1); //  student confirm the invitation
            classroomUserDao.merge(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/ignoreRequest",method = RequestMethod.POST)
    @ResponseBody
    public String ignoreRequest(@RequestParam Integer requestId) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "NG";
        }
        ClassroomUser classroomUser = classroomUserDao.find(requestId);
        try {
            classroomUser.setApproval(2); // 2 = ignore
            classroomUserDao.merge(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/confirmRequest",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public StudentDto confirmRequest(@RequestParam Integer requestId) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user==null){
            return null;
        }
        ClassroomUser classroomUser = classroomUserDao.find(requestId);
        StudentDto studentDto = new StudentDto();
        try {
            classroomUser.setApproval(1); // 1 = confirm
            classroomUserDao.merge(classroomUser);
            studentDto = ConvertEntityDto.convertClassroomUserEntityToStudentDto(classroomUser);
        } catch (Exception e){

        }
        return studentDto;
    }

    @RequestMapping(value = "/removeStudent",method = RequestMethod.POST)
    @ResponseBody
    public String removeStudent(@RequestParam Integer removeId) {
        //authorize
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "NG";
        }
        ClassroomUser classroomUser = classroomUserDao.find(removeId);
        try {
            newsFeedUtilities.removeQuestionsOfClassroom(user.getId(),classroomUser.getClassroomId().getId());
            classroomUserDao.delete(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }

}
