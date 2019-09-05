package com.gs.domain;

public class PomsEnergyUsingSystem {
    private String id;

    private String euiId;

    private String systemModelId;

    private String eusNames;

    public int getEusLevel() {
        return eusLevel;
    }

    public void setEusLevel(int eusLevel) {
        this.eusLevel = eusLevel;
    }

    private int eusLevel;

    private String eulId;

    private String eusBackups;

    private String eusParentId;

    private String eusCode;

    private String eusImg;

    public String getEusImg() {
        return eusImg;
    }

    public void setEusImg(String eusImg) {
        this.eusImg = eusImg;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEuiId() {
        return euiId;
    }

    public void setEuiId(String euiId) {
        this.euiId = euiId == null ? null : euiId.trim();
    }

    public String getSystemModelId() {
        return systemModelId;
    }

    public void setSystemModelId(String systemModelId) {
        this.systemModelId = systemModelId == null ? null : systemModelId.trim();
    }

    public String getEusNames() {
        return eusNames;
    }

    public void setEusNames(String eusNames) {
        this.eusNames = eusNames == null ? null : eusNames.trim();
    }

    public String getEulId() {
        return eulId;
    }

    public void setEulId(String eulId) {
        this.eulId = eulId == null ? null : eulId.trim();
    }

    public String getEusBackups() {
        return eusBackups;
    }

    public void setEusBackups(String eusBackups) {
        this.eusBackups = eusBackups == null ? null : eusBackups.trim();
    }

    public String getEusParentId() {
        return eusParentId;
    }

    public void setEusParentId(String eusParentId) {
        this.eusParentId = eusParentId == null ? null : eusParentId.trim();
    }

    public String getEusCode() {
        return eusCode;
    }

    public void setEusCode(String eusCode) {
        this.eusCode = eusCode == null ? null : eusCode.trim();
    }
}