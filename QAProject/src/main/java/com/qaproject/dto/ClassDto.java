package com.qaproject.dto;

import com.sun.javafx.binding.StringFormatter;

import java.util.List;

/**
 * Created by TADUCTUNG on 11-Jun-15.
 */
public class ClassDto {
    private String className;
    private List<String> tagList;
    private String categoryId;
    private String classDescription;
    private List<String> studentList;
    private int id;

    public ClassDto(String className, List<String> tagList, String categoryId, String classDescription, List<String> studentList) {
        this.className = className;
        this.tagList = tagList;
        this.categoryId = categoryId;
        this.classDescription = classDescription;
        this.studentList = studentList;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public List<String> getTagList() {
        return tagList;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getClassDescription() {
        return classDescription;
    }

    public void setClassDescription(String classDescription) {
        this.classDescription = classDescription;
    }

    public List<String> getStudentList() {
        return studentList;
    }

    public void setStudentList(List<String> studentList) {
        this.studentList = studentList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
