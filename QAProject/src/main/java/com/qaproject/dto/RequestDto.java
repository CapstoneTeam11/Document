package com.qaproject.dto;

/**
 * Created by Minh on 6/28/2015.
 */
public class RequestDto {
    private Integer id; //this id is used for ClassroomUser
    private Integer studentId;
    private String studentName;
    private String studentProfileImageURL;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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


}
