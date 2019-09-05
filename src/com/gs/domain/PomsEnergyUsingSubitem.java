package com.gs.domain;

public class PomsEnergyUsingSubitem {
    private String id;

    private String euiId;

    private String eussubNames;

    private String eussubOrders;

    private String eussubBackups;

    private String eussubParentId;

    private String eussubCode;

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

    public String getEussubNames() {
        return eussubNames;
    }

    public void setEussubNames(String eussubNames) {
        this.eussubNames = eussubNames == null ? null : eussubNames.trim();
    }

    public String getEussubOrders() {
        return eussubOrders;
    }

    public void setEussubOrders(String eussubOrders) {
        this.eussubOrders = eussubOrders == null ? null : eussubOrders.trim();
    }

    public String getEussubBackups() {
        return eussubBackups;
    }

    public void setEussubBackups(String eussubBackups) {
        this.eussubBackups = eussubBackups == null ? null : eussubBackups.trim();
    }

    public String getEussubParentId() {
        return eussubParentId;
    }

    public void setEussubParentId(String eussubParentId) {
        this.eussubParentId = eussubParentId == null ? null : eussubParentId.trim();
    }

    public String getEussubCode() {
        return eussubCode;
    }

    public void setEussubCode(String eussubCode) {
        this.eussubCode = eussubCode == null ? null : eussubCode.trim();
    }
}