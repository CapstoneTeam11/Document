package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 09-Jun-15.
 */
public class ReturnObjectWithStatus {
    private String status;
    private int id;
    public ReturnObjectWithStatus(String status) {
        this.status = status;
    }

    public ReturnObjectWithStatus(String status, int id) {
        this.status = status;
        this.id = id;
    }
    public ReturnObjectWithStatus(){}
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
