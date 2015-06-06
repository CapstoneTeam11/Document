package com.qaproject.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class Material {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "Name")
    private String name;
    @JoinColumn(name = "FolderId", referencedColumnName = "Id")
    @ManyToOne
    private Folder folderId;
    @JoinColumn(name = "OwnerClassId", referencedColumnName = "Id")
    @ManyToOne
    private Classroom ownerClassId;
    @Column(name = "CreationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Size")
    private Double size;
    @Column(name = "FileURL")
    private String fileURL;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Folder getFolderId() {
        return folderId;
    }

    public void setFolderId(Folder folderId) {
        this.folderId = folderId;
    }

    public Classroom getOwnerClassId() {
        return ownerClassId;
    }

    public void setOwnerClassId(Classroom ownerClassId) {
        this.ownerClassId = ownerClassId;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    public String getFileURL() {
        return fileURL;
    }

    public void setFileURL(String fileURL) {
        this.fileURL = fileURL;
    }
}
