package com.qaproject.dto;

/**
 * Created by Minh on 6/21/2015.
 */
public class FollowerDto {
    private Integer id;
    private Integer teacherId;
    private String teacherName;
    private String aboutTeacher;
    private String profileImageURL;
    private Integer followerId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getAboutTeacher() {
        return aboutTeacher;
    }

    public void setAboutTeacher(String aboutTeacher) {
        this.aboutTeacher = aboutTeacher;
    }

    public Integer getFollowerId() {
        return followerId;
    }

    public void setFollowerId(Integer followerId) {
        this.followerId = followerId;
    }

    public String getProfileImageURL() {
        return profileImageURL;
    }

    public void setProfileImageURL(String profileImageURL) {
        this.profileImageURL = profileImageURL;
    }
}
