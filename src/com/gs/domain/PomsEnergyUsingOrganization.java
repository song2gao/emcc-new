package com.gs.domain;

public class PomsEnergyUsingOrganization {
    private String id;

    private String euiId;

    private String euoCode;

    private String euoNames;

    private String euoOrders;

    private String euoBackups;

    private String euoParentId;

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

    public String getEuoCode() {
        return euoCode;
    }

    public void setEuoCode(String euoCode) {
        this.euoCode = euoCode == null ? null : euoCode.trim();
    }

    public String getEuoNames() {
        return euoNames;
    }

    public void setEuoNames(String euoNames) {
        this.euoNames = euoNames == null ? null : euoNames.trim();
    }

    public String getEuoOrders() {
        return euoOrders;
    }

    public void setEuoOrders(String euoOrders) {
        this.euoOrders = euoOrders == null ? null : euoOrders.trim();
    }

    public String getEuoBackups() {
        return euoBackups;
    }

    public void setEuoBackups(String euoBackups) {
        this.euoBackups = euoBackups == null ? null : euoBackups.trim();
    }

    public String getEuoParentId() {
        return euoParentId;
    }

    public void setEuoParentId(String euoParentId) {
        this.euoParentId = euoParentId == null ? null : euoParentId.trim();
    }
}