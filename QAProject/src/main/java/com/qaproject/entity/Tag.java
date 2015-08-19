package com.qaproject.entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "TagName")
    private String tagName;
    @Column(name = "TagCount")
    private Integer tagCount;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tagId")
    private List<TagPost> tagPostList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tagId")
    private List<TagClassroom> tagClassroomList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tagId")
    private List<TagUser> tagUserList;

    public Tag() {
    }

    public Tag(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public Integer getTagCount() {
        return tagCount;
    }

    public void setTagCount(Integer tagCount) {
        this.tagCount = tagCount;
    }

    public List<TagPost> getTagPostList() {
        return tagPostList;
    }

    public void setTagPostList(List<TagPost> tagPostList) {
        this.tagPostList = tagPostList;
    }

    public List<TagClassroom> getTagClassroomList() {
        return tagClassroomList;
    }

    public void setTagClassroomList(List<TagClassroom> tagClassroomList) {
        this.tagClassroomList = tagClassroomList;
    }

    public List<TagUser> getTagUserList() {
        return tagUserList;
    }

    public void setTagUserList(List<TagUser> tagUserList) {
        this.tagUserList = tagUserList;
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
        if (!(object instanceof Tag)) {
            return false;
        }
        Tag other = (Tag) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.Tag[ id=" + id + " ]";
    }

}
