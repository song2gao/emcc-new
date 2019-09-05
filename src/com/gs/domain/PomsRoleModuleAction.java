package com.gs.domain;

public class PomsRoleModuleAction {
    private String id;

    private String mmId;

    private String raId;

    private String maId;

    private String rmaBackups;

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

    public String getRaId() {
        return raId;
    }

    public void setRaId(String raId) {
        this.raId = raId == null ? null : raId.trim();
    }

    public String getMaId() {
        return maId;
    }

    public void setMaId(String maId) {
        this.maId = maId == null ? null : maId.trim();
    }

    public String getRmaBackups() {
        return rmaBackups;
    }

    public void setRmaBackups(String rmaBackups) {
        this.rmaBackups = rmaBackups == null ? null : rmaBackups.trim();
    }
}