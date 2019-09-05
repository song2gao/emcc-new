package com.gs.domain;

public class PomsRoleAuthorization {
    private String id;

    private String roleCodes;

    private String roleName;

    private String roleDescription;

    private String roleBackups;

    private String roleCreater;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRoleCodes() {
        return roleCodes;
    }

    public void setRoleCodes(String roleCodes) {
        this.roleCodes = roleCodes == null ? null : roleCodes.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription == null ? null : roleDescription.trim();
    }

    public String getRoleBackups() {
        return roleBackups;
    }

    public void setRoleBackups(String roleBackups) {
        this.roleBackups = roleBackups == null ? null : roleBackups.trim();
    }

    public String getRoleCreater() {
        return roleCreater;
    }

    public void setRoleCreater(String roleCreater) {
        this.roleCreater = roleCreater == null ? null : roleCreater.trim();
    }
}