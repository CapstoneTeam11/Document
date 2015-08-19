package com.qaproject.dto;

/**
 * Created by khangtnse60992 on 6/10/2015.
 */
public class AnswerDto {
    private Integer ownerId;
    private Integer parentId;
    private String body;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
