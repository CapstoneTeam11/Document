package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 22-Jun-15.
 */
public class ArticleDto {
    private String questionId;
    private String questionTitle;
    private String questionOwnerUserId;
    private String questionOwnerUserName;
    private String questionBody;
    private String questionAcceptedAnswerId;
    private String questionLastEditedDate;
    private String classroomName;
    private String replyCount;

    public ArticleDto() {
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public String getQuestionOwnerUserId() {
        return questionOwnerUserId;
    }

    public void setQuestionOwnerUserId(String questionOwnerUserId) {
        this.questionOwnerUserId = questionOwnerUserId;
    }

    public String getQuestionOwnerUserName() {
        return questionOwnerUserName;
    }

    public void setQuestionOwnerUserName(String questionOwnerUserName) {
        this.questionOwnerUserName = questionOwnerUserName;
    }

    public String getQuestionBody() {
        return questionBody;
    }

    public void setQuestionBody(String questionBody) {
        this.questionBody = questionBody;
    }

    public String getQuestionAcceptedAnswerId() {
        return questionAcceptedAnswerId;
    }

    public void setQuestionAcceptedAnswerId(String questionAcceptedAnswerId) {
        this.questionAcceptedAnswerId = questionAcceptedAnswerId;
    }

    public String getQuestionLastEditedDate() {
        return questionLastEditedDate;
    }

    public void setQuestionLastEditedDate(String questionLastEditedDate) {
        this.questionLastEditedDate = questionLastEditedDate;
    }

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }

    public String getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(String replyCount) {
        this.replyCount = replyCount;
    }
}
