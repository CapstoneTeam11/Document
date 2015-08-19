package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 6/30/2015.
 */
@Entity
@Table(name = "tag_material", schema = "", catalog = "qav2")
public class TagMaterial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "MaterialId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Material materialId;
    @JoinColumn(name = "TagId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Tag tagId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Material getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Material materialId) {
        this.materialId = materialId;
    }

    public Tag getTagId() {
        return tagId;
    }

    public void setTagId(Tag tagId) {
        this.tagId = tagId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "com.qaproject.entity.TagPost[ id=" + id + " ]";
    }

}