package com.gs.domain;

public class PomsUsersManagement {
    private String id;

    private String staffCodes;

    private String loginName;

    private String loginPassword;

    private String parentUmId;

    private String umIsdelete;

    private String umBackups;

    private String umOrders;

    private Integer isGovenment;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getStaffCodes() {
        return staffCodes;
    }

    public void setStaffCodes(String staffCodes) {
        this.staffCodes = staffCodes == null ? null : staffCodes.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword == null ? null : loginPassword.trim();
    }

    public String getParentUmId() {
        return parentUmId;
    }

    public void setParentUmId(String parentUmId) {
        this.parentUmId = parentUmId == null ? null : parentUmId.trim();
    }

    public String getUmIsdelete() {
        return umIsdelete;
    }

    public void setUmIsdelete(String umIsdelete) {
        this.umIsdelete = umIsdelete == null ? null : umIsdelete.trim();
    }

    public String getUmBackups() {
        return umBackups;
    }

    public void setUmBackups(String umBackups) {
        this.umBackups = umBackups == null ? null : umBackups.trim();
    }

    public String getUmOrders() {
        return umOrders;
    }

    public void setUmOrders(String umOrders) {
        this.umOrders = umOrders == null ? null : umOrders.trim();
    }

    public Integer getIsGovenment() {
        return isGovenment;
    }

    public void setIsGovenment(Integer isGovenment) {
        this.isGovenment = isGovenment;
    }
}