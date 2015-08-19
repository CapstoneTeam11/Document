package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 20-Jun-15.
 */
public class ClassUserDto {
    private String joinRequest;
    private String ownerUserId;
    private String classroomId;
    private String userDisplayName;
    private String classroomName;
    private int userRoleId;
    private int userId;
    public ClassUserDto() {
    }

    public String getJoinRequest() {
        return joinRequest;
    }

    public void setJoinRequest(String joinRequest) {
        this.joinRequest = joinRequest;
    }

    public String getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(String ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public String getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(String classroomId) {
        this.classroomId = classroomId;
    }

    public String getUserDisplayName() {
        return userDisplayName;
    }

    public void setUserDisplayName(String userDisplayName) {
        this.userDisplayName = userDisplayName;
    }

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
