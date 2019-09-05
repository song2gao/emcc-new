package com.gs.domain;

public class PomsUserDefinedStatistics {
    private String id;

    private String euiId;

    private String udsNames;

    private String udsOrders;

    private String udsBackups;

    private String udsParentId;

    private String udsCode;

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

    public String getUdsNames() {
        return udsNames;
    }

    public void setUdsNames(String udsNames) {
        this.udsNames = udsNames == null ? null : udsNames.trim();
    }

    public String getUdsOrders() {
        return udsOrders;
    }

    public void setUdsOrders(String udsOrders) {
        this.udsOrders = udsOrders == null ? null : udsOrders.trim();
    }

    public String getUdsBackups() {
        return udsBackups;
    }

    public void setUdsBackups(String udsBackups) {
        this.udsBackups = udsBackups == null ? null : udsBackups.trim();
    }

    public String getUdsParentId() {
        return udsParentId;
    }

    public void setUdsParentId(String udsParentId) {
        this.udsParentId = udsParentId == null ? null : udsParentId.trim();
    }

    public String getUdsCode() {
        return udsCode;
    }

    public void setUdsCode(String udsCode) {
        this.udsCode = udsCode == null ? null : udsCode.trim();
    }
}