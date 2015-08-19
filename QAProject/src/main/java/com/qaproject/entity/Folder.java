package com.qaproject.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/6/2015.
 */
@Entity
public class Folder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "ManagerId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User managerId;
    @Column(name = "Name")
    private String name;
    @OneToMany(mappedBy = "folderId",cascade = CascadeType.ALL,fetch = FetchType.LAZY,orphanRemoval = true)
    private List<Material> materialList = new ArrayList<Material>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getManagerId() {
        return managerId;
    }

    public void setManagerId(User managerId) {
        this.managerId = managerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Material> getMaterialList() {
        return materialList;
    }

    public void setMaterialList(List<Material> materialList) {
        this.materialList = materialList;
    }

    public boolean checkUser(User user) {
        if(user.getId()==managerId.getId()){
            return true;
        }
        return false;
    }
}
