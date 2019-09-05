package com.gs.domain;

public class PomsRolesUsersRela {
    private String id;

    private String roleId;

    private String userId;

    private String rurBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRurBackups() {
        return rurBackups;
    }

    public void setRurBackups(String rurBackups) {
        this.rurBackups = rurBackups == null ? null : rurBackups.trim();
    }
}