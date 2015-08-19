package com.qaproject.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "isAccepted")
    private Integer acceptedAnswerId;
    @Column(name = "ParentId")
    private Integer parentId;
    @Column(name = "CreationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "Title")
    private String title;
    @Lob
    @Column(name = "Body")
    private String body;
    @Column(name = "PostType")
    private Integer postType;
    @Column(name = "LastEditedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastEditedDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "postId",orphanRemoval = true)
    private List<TagPost> tagPostList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "postId")
    private List<PostInvitation> postInvitationList;
    @JoinColumn(name = "OwnerUserId", referencedColumnName = "Id")
    @ManyToOne
    private User ownerUserId;
    @JoinColumn(name = "OwnerClassId", referencedColumnName = "Id")
    @ManyToOne
    private Classroom ownerClassId;
    @Column(name = "Viewer")
    private Integer viewer;
    @Column(name = "Status")
    private Integer status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "postId")
    private List<WantAnswerPost> wantAnswerPosts;
    @Transient
    private Integer isComment = 0;
    @Transient
    private List<Integer> listUserNotification ;
    @Transient
    private Double score = 0.0 ;
    @Transient
    private Integer similar ;
    public Post() {
    }

    public Post(Integer id) {
        this.id = id;
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

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
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

    public Date getLastEditedDate() {
        return lastEditedDate;
    }

    public void setLastEditedDate(Date lastEditedDate) {
        this.lastEditedDate = lastEditedDate;
    }

    public List<TagPost> getTagPostList() {
        if(tagPostList==null) {
            tagPostList = new ArrayList<TagPost>();
        }
        return tagPostList;
    }

    public List<PostInvitation> getPostInvitationList() {
        if(postInvitationList==null) {
            postInvitationList = new ArrayList<PostInvitation>();
        }
        return postInvitationList;
    }

    public void setPostInvitationList(List<PostInvitation> postInvitationList) {
        this.postInvitationList = postInvitationList;
    }

    public void setTagPostList(List<TagPost> tagPostList) {
        this.tagPostList = tagPostList;
    }

    public User getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(User ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public Classroom getOwnerClassId() {
        return ownerClassId;
    }

    public void setOwnerClassId(Classroom ownerClassId) {
        this.ownerClassId = ownerClassId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsComment() {
        return isComment;
    }

    public void setIsComment(Integer isComment) {
        this.isComment = isComment;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.Post[ id=" + id + " ]";
    }

    public Integer getViewer() {
        return viewer;
    }

    public void setViewer(Integer viewer) {
        this.viewer = viewer;
    }

    public List<WantAnswerPost> getWantAnswerPosts() {
        return wantAnswerPosts;
    }

    public void setWantAnswerPosts(List<WantAnswerPost> wantAnswerPosts) {
        this.wantAnswerPosts = wantAnswerPosts;
    }

    public List<Integer> getListUserNotification(List<Post> answers) {
        List<Integer> users = new ArrayList<Integer>();
        for(int i = 0 ; i < wantAnswerPosts.size() ; i++) {
            users.add(wantAnswerPosts.get(i).getUserId().getId());
        }
        for(int i = 0 ; i < answers.size();i++) {
            if(!users.contains(answers.get(i).getOwnerUserId().getId())){
                users.add(answers.get(i).getOwnerUserId().getId());
            }
        }
        return listUserNotification;
    }

    public WantAnswerPost checkWantToAnswer(int userId) {
        for (int i = 0; i < wantAnswerPosts.size(); i++) {
            if(wantAnswerPosts.get(i).getUserId().getId()==userId) {
                return wantAnswerPosts.get(i);
            }
        }
        return null ;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getSimilar() {
        return similar;
    }

    public void setSimilar(Integer similar) {
        if(null == similar || similar!=0) {
        this.similar = similar;
        }
    }
}
