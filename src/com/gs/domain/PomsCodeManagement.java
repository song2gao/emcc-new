package com.gs.domain;

public class PomsCodeManagement {
    private String cmId;

    private String cmParentId;

    private String cmName;

    private String cmCode;

    private String cmDescription;

    private String cmCodeType;

    private String cmBackupone;

    private String cmBackuptwo;

    private String cmBackupthree;

    private String cmBackups;

    public String getCmId() {
        return cmId;
    }

    public void setCmId(String cmId) {
        this.cmId = cmId == null ? null : cmId.trim();
    }

    public String getCmParentId() {
        return cmParentId;
    }

    public void setCmParentId(String cmParentId) {
        this.cmParentId = cmParentId == null ? null : cmParentId.trim();
    }

    public String getCmName() {
        return cmName;
    }

    public void setCmName(String cmName) {
        this.cmName = cmName == null ? null : cmName.trim();
    }

    public String getCmCode() {
        return cmCode;
    }

    public void setCmCode(String cmCode) {
        this.cmCode = cmCode == null ? null : cmCode.trim();
    }

    public String getCmDescription() {
        return cmDescription;
    }

    public void setCmDescription(String cmDescription) {
        this.cmDescription = cmDescription == null ? null : cmDescription.trim();
    }

    public String getCmCodeType() {
        return cmCodeType;
    }

    public void setCmCodeType(String cmCodeType) {
        this.cmCodeType = cmCodeType == null ? null : cmCodeType.trim();
    }

    public String getCmBackupone() {
        return cmBackupone;
    }

    public void setCmBackupone(String cmBackupone) {
        this.cmBackupone = cmBackupone == null ? null : cmBackupone.trim();
    }

    public String getCmBackuptwo() {
        return cmBackuptwo;
    }

    public void setCmBackuptwo(String cmBackuptwo) {
        this.cmBackuptwo = cmBackuptwo == null ? null : cmBackuptwo.trim();
    }

    public String getCmBackupthree() {
        return cmBackupthree;
    }

    public void setCmBackupthree(String cmBackupthree) {
        this.cmBackupthree = cmBackupthree == null ? null : cmBackupthree.trim();
    }

    public String getCmBackups() {
        return cmBackups;
    }

    public void setCmBackups(String cmBackups) {
        this.cmBackups = cmBackups == null ? null : cmBackups.trim();
    }
}