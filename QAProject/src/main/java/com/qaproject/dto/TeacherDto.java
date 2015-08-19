package com.qaproject.dto;

/**
 * Created by khangtnse60992 on 6/10/2015.
 */
public class TeacherDto {
    private int id;
    private String name;
    private String profilePicture;

    public TeacherDto(int id, String name,String profilePicture) {
        this.id = id;
        this.name = name;
        this.profilePicture=profilePicture;
    }

    public TeacherDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }
}
