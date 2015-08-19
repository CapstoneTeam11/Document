package com.qaproject.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
@Table(name = "classroom")
public class Classroom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "ClassroomName")
    private String classroomName;
    @Column(name = "ClassroomDescription")
    private String classroomDescription;
    @JoinColumn(name = "OwnerUserId", referencedColumnName = "Id")
    @ManyToOne
    private User ownerUserId;
    @JoinColumn(name = "CategoryId", referencedColumnName = "Id")
    @ManyToOne
    private Category categoryId;
    @Column(name = "Status")
    private Integer status;
    @Column(name = "ActiveTime")
    private Date activeTime;
    @OneToMany(mappedBy = "ownerClassId",fetch = FetchType.LAZY)
    private List<Post> postList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "classroomId",orphanRemoval = true)
    private List<TagClassroom> tagClassroomList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "classroomId",fetch = FetchType.LAZY,orphanRemoval = true)
    private List<ClassroomUser> classroomUserList;
    @OneToMany(mappedBy = "ownerClassId",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Material> materialList;

    public Classroom() {
    }

    public Classroom(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }

    public String getClassroomDescription() {
        return classroomDescription;
    }

    public void setClassroomDescription(String classroomDescription) {
        this.classroomDescription = classroomDescription;
    }

    public User getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(User ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public List<TagClassroom> getTagClassroomList() {
        if(tagClassroomList==null) {
            tagClassroomList = new ArrayList<TagClassroom>();
        }
        return tagClassroomList;
    }

    public void setTagClassroomList(List<TagClassroom> tagClassroomList) {
        this.tagClassroomList = tagClassroomList;
    }

    public List<ClassroomUser> getClassroomUserList() {
        return classroomUserList;
    }

    public void setClassroomUserList(List<ClassroomUser> classroomUserList) {
        this.classroomUserList = classroomUserList;
    }

    public List<Material> getMaterialList() {
        if(materialList==null) {
            materialList = new ArrayList<Material>();
        }
        return materialList;
    }

    public void setMaterialList(List<Material> materialList) {
        this.materialList = materialList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
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
        if (!(object instanceof Classroom)) {
            return false;
        }
        Classroom other = (Classroom) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.Classroom[ id=" + id + " ]";
    }

    public boolean checkUserExist(User user) {
        if(user.getId()==ownerUserId.getId()) {
            return true;
        }
        for(int i = 0 ; i < classroomUserList.size();i++) {
            if(classroomUserList.get(i).getUserId().getId()==user.getId() && classroomUserList.get(i).getApproval()==1){
                return true;
            }
        }
        return false;
    }
}
