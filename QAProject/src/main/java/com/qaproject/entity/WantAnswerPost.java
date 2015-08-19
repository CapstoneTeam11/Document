package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 6/12/2015.
 */
@Entity
public class WantAnswerPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "UserId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User userId;
    @JoinColumn(name = "PostId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Post postId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Post getPostId() {
        return postId;
    }

    public void setPostId(Post postId) {
        this.postId = postId;
    }
}
