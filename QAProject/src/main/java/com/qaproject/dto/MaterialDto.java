package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 22-Jun-15.
 */
public class MaterialDto {
    private Integer id;
    private String name;
    private Integer folderId;
    private String folderName;
    private Integer ownerClassroomId;
    private String ownerClassroomName;
    private String creationDate;
    private Double size;
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

    public Integer getFolderId() {
        return folderId;
    }

    public void setFolderId(Integer folderId) {
        this.folderId = folderId;
    }

    public String getFolderName() {
        return folderName;
    }

    public void setFolderName(String folderName) {
        this.folderName = folderName;
    }

    public Integer getOwnerClassroomId() {
        return ownerClassroomId;
    }

    public void setOwnerClassroomId(Integer ownerClassroomId) {
        this.ownerClassroomId = ownerClassroomId;
    }

    public String getOwnerClassroomName() {
        return ownerClassroomName;
    }

    public void setOwnerClassroomName(String ownerClassroomName) {
        this.ownerClassroomName = ownerClassroomName;
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

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }
}
