package com.gs.domain;

public class PomsEnergyUsingSystemModel {
    private String id;

    private String systemModelName;

    private String systemModelBackups;

    private String systemModelType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSystemModelName() {
        return systemModelName;
    }

    public void setSystemModelName(String systemModelName) {
        this.systemModelName = systemModelName == null ? null : systemModelName.trim();
    }

    public String getSystemModelBackups() {
        return systemModelBackups;
    }

    public void setSystemModelBackups(String systemModelBackups) {
        this.systemModelBackups = systemModelBackups == null ? null : systemModelBackups.trim();
    }

    public String getSystemModelType() {
        return systemModelType;
    }

    public void setSystemModelType(String systemModelType) {
        this.systemModelType = systemModelType == null ? null : systemModelType.trim();
    }
}