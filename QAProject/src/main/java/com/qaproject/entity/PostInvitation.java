package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Entity
@Table(name = "post_invitation", schema = "", catalog = "qav2")
public class PostInvitation {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "TeacherId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User teacherId;
    @JoinColumn(name = "PostId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Post postId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(User teacherId) {
        this.teacherId = teacherId;
    }

    public Post getPostId() {
        return postId;
    }

    public void setPostId(Post postId) {
        this.postId = postId;
    }

}
