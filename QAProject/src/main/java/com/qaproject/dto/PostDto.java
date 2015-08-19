package com.qaproject.dto;

import java.util.Date;

/**
 * Created by khangtnse60992 on 6/10/2015.
 */
public class PostDto {

    private Integer id;
    private Integer acceptedAnswerId;
    private Integer parentId;
    private String title;
    private String body;
    private Integer postType;
    private String lastEditedDate;
    private Integer ownerId;
    private String className;
    private String ownerName;
    private String ownerProfileImageURL;
    private Integer similar;
    //MinhKH
    private Integer classId;
    private Integer answerCount;
    private Integer viewer;


    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getLastEditedDate() {
        return lastEditedDate;
    }

    public void setLastEditedDate(String lastEditedDate) {
        this.lastEditedDate = lastEditedDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAcceptedAnswerId() {
        return acceptedAnswerId;
    }

    public void setAcceptedAnswerId(Integer acceptedAnswerId) {
        this.acceptedAnswerId = acceptedAnswerId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Integer getPostType() {
        return postType;
    }

    public void setPostType(Integer postType) {
        this.postType = postType;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(Integer answerCount) {
        this.answerCount = answerCount;
    }


    public String getOwnerProfileImageURL() {
        return ownerProfileImageURL;
    }

    public void setOwnerProfileImageURL(String ownerProfileImageURL) {
        this.ownerProfileImageURL = ownerProfileImageURL;
    }

    public Integer getViewer() {
        return viewer;
    }

    public void setViewer(Integer viewer) {
        this.viewer = viewer;
    }

    public Integer getSimilar() {
        return similar;
    }

    public void setSimilar(Integer similar) {
        this.similar = similar;
    }
}
