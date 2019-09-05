package com.gs.domain;

public class PomsModuleActionRelation {
    private String id;

    private String mmId;

    private String maId;

    private String marBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMmId() {
        return mmId;
    }

    public void setMmId(String mmId) {
        this.mmId = mmId == null ? null : mmId.trim();
    }

    public String getMaId() {
        return maId;
    }

    public void setMaId(String maId) {
        this.maId = maId == null ? null : maId.trim();
    }

    public String getMarBackups() {
        return marBackups;
    }

    public void setMarBackups(String marBackups) {
        this.marBackups = marBackups == null ? null : marBackups.trim();
    }
}