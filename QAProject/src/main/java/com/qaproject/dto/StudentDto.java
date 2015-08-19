package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 08-Jun-15.
 */
public class StudentDto {
    private Integer classroomUserId; //this id is used for ClassroomUser, -> classroom dashboard page
    private Integer studentId;
    private String studentName;
    private String studentProfileImageURL;

    public StudentDto() {
    }

    public StudentDto(String studentName, Integer studentId) {
        this.studentName = studentName;
        this.studentId = studentId;
    }

    public StudentDto(String studentName, Integer studentId, String studentProfileImageURL) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentProfileImageURL = studentProfileImageURL;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentProfileImageURL() {
        return studentProfileImageURL;
    }

    public void setStudentProfileImageURL(String studentProfileImageURL) {
        this.studentProfileImageURL = studentProfileImageURL;
    }

    public Integer getClassroomUserId() {
        return classroomUserId;
    }

    public void setClassroomUserId(Integer classroomUserId) {
        this.classroomUserId = classroomUserId;
    }
}

