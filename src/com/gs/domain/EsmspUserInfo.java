package com.gs.domain;

public class EsmspUserInfo {
    private String userId;

    private String userName;

    private Float userAmount;

    private String rightsId;

    private String userNote;

    private String userTel;

    private String userAddress;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Float getUserAmount() {
        return userAmount;
    }

    public void setUserAmount(Float userAmount) {
        this.userAmount = userAmount;
    }

    public String getRightsId() {
        return rightsId;
    }

    public void setRightsId(String rightsId) {
        this.rightsId = rightsId;
    }

    public String getUserNote() {
        return userNote;
    }

    public void setUserNote(String userNote) {
        this.userNote = userNote == null ? null : userNote.trim();
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }
}