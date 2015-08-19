package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Entity
public class Follower {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "TeacherId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User teacherId;
    @JoinColumn(name = "FollowerId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User followerId;

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

    public User getFollowerId() {
        return followerId;
    }

    public void setFollowerId(User followerId) {
        this.followerId = followerId;
    }
}
