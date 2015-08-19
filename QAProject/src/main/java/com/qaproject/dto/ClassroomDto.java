package com.qaproject.dto;

/**
 * Created by Minh on 6/22/2015.
 */
public class ClassroomDto {
    private Integer id;
    private Integer teacherId;
    private String classroomName;
    private String classroomDescription;
    private Integer status;
    private Integer joinedId; //use for student with joined classroom

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

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }

    public String getClassroomDescription() {
        return classroomDescription;
    }

    public void setClassroomDescription(String classroomDescription) {
        this.classroomDescription = classroomDescription;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getJoinedId() {
        return joinedId;
    }

    public void setJoinedId(Integer joinedId) {
        this.joinedId = joinedId;
    }
}
