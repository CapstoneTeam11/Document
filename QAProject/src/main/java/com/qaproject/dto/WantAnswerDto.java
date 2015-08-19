package com.qaproject.dto;

/**
 * Created by khangtnse60992 on 6/13/2015.
 */
public class WantAnswerDto {
    private int id;
    private int postId;
    private int userId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
