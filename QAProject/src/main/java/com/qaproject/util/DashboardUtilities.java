package com.qaproject.util;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.ClassroomInvitationDto;
import com.qaproject.dto.FollowerDto;
import com.qaproject.dto.PostInvitationDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Follower;
import com.qaproject.entity.PostInvitation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/22/2015.
 */
@Component
public class DashboardUtilities {
    @Autowired
    FollowerDao followerDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostInvitationDao postInvitationDao;

    public List<FollowerDto> loadFollowedTeachers(Integer followerId, Integer lastId) {
        List<FollowerDto> followerDtos = new ArrayList<FollowerDto>();
        List<Follower> followers = followerDao.findFollowedTeacherForDashboard(followerId, lastId);
        if (followers!=null){
            for(Follower follower : followers) {
                FollowerDto followerDto = ConvertEntityDto.convertFollowerEntityToDto(follower);
                followerDtos.add(followerDto);
            }
        }
        return followerDtos;
    }

    public List<ClassroomDto> loadJoinedClassrooms(Integer studentId, Integer lastId) {
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        List<ClassroomUser> classroomUsers = classroomUserDao.findJoinedClassroomUserForDashboard(studentId, lastId);
        if (classroomUsers!=null){
            for (ClassroomUser classroomUser : classroomUsers) {
                ClassroomDto classroomDto = ConvertEntityDto.convertClassroomUserEntityToClassroomDto(classroomUser);
                classroomDtos.add(classroomDto);
            }
        }
        return classroomDtos;
    }

    public List<ClassroomDto> loadOwnedClassrooms(Integer ownerUserId, Integer lastId) {
        List<ClassroomDto> classroomDtos = new ArrayList<ClassroomDto>();
        List<Classroom> classrooms = classroomDao.findOwnedClassroomForDashboard(ownerUserId, lastId);
        if (classrooms!=null){
            for (Classroom classroom : classrooms) {
                ClassroomDto classroomDto = ConvertEntityDto.convertClassroomEntityToDto(classroom);
                classroomDtos.add(classroomDto);
            }
        }
        return classroomDtos;
    }

    public List<ClassroomInvitationDto> loadClassroomInvitations(Integer studentId, Integer lastId){
        List<ClassroomInvitationDto> classroomInvitationDtos = new ArrayList<ClassroomInvitationDto>();
        List<ClassroomUser> classroomUsers = classroomUserDao.findInvitationClassroomUserForDashboard(studentId, lastId);
        if (classroomUsers!=null) {
            for (ClassroomUser classroomUser : classroomUsers) {
                ClassroomInvitationDto classroomInvitationDto =
                        ConvertEntityDto.convertClassroomUserEntityToClassroomInvitationDto(classroomUser);
                classroomInvitationDtos.add(classroomInvitationDto);
            }
        }
        return classroomInvitationDtos;
    }

    public List<PostInvitationDto> loadPostInvitations(Integer teacherId, Integer lastId){
        List<PostInvitationDto> postInvitationDtos = new ArrayList<PostInvitationDto>();
        List<PostInvitation> postInvitations = postInvitationDao.findPostInvitationForDashboard(teacherId,lastId);
        if (postInvitations!=null) {
            for (PostInvitation postInvitation : postInvitations) {
                PostInvitationDto postInvitationDto = ConvertEntityDto.convertPostInvitationEntityToDto(postInvitation);
                postInvitationDtos.add(postInvitationDto);
            }
        }
        return postInvitationDtos;
    }
}
