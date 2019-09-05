package com.gs.domain;

import java.math.BigDecimal;

public class PomsEnergyUsingLocation {
    private String id;

    private String euiId;

    private String eulNames;

    private String eulOrders;

    private String eulBackups;

    private String eulParentId;

    private String eulImg;

    private String eulHeight;

    private String eulFloor;

    public String getEulHeight() {
        return eulHeight;
    }

    public void setEulHeight(String eulHeight) {
        this.eulHeight = eulHeight;
    }

    public String getEulFloor() {
        return eulFloor;
    }

    public void setEulFloor(String eulFloor) {
        this.eulFloor = eulFloor;
    }

    public String getEulFloorHeight() {
        return eulFloorHeight;
    }

    public void setEulFloorHeight(String eulFloorHeight) {
        this.eulFloorHeight = eulFloorHeight;
    }

    public String getEulFacility() {
        return eulFacility;
    }

    public void setEulFacility(String eulFacility) {
        this.eulFacility = eulFacility;
    }

    public String getEulSiteArea() {
        return eulSiteArea;
    }

    public void setEulSiteArea(String eulSiteArea) {
        this.eulSiteArea = eulSiteArea;
    }

    private String eulFloorHeight;

    private String eulFacility;

    private String eulSiteArea;

    public String getEulImg() {
        return eulImg;
    }

    public void setEulImg(String eulImg) {
        this.eulImg = eulImg;
    }

    public String getEulLongitude() {
        return eulLongitude;
    }

    public void setEulLongitude(String eulLongitude) {
        this.eulLongitude = eulLongitude;
    }

    private String eulLongitude;

    private Integer eulHoldPersons;

    private String eulHoldArea;

    private String euiCode;

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

    public String getEulNames() {
        return eulNames;
    }

    public void setEulNames(String eulNames) {
        this.eulNames = eulNames == null ? null : eulNames.trim();
    }

    public String getEulOrders() {
        return eulOrders;
    }

    public void setEulOrders(String eulOrders) {
        this.eulOrders = eulOrders == null ? null : eulOrders.trim();
    }

    public String getEulBackups() {
        return eulBackups;
    }

    public void setEulBackups(String eulBackups) {
        this.eulBackups = eulBackups == null ? null : eulBackups.trim();
    }

    public String getEulParentId() {
        return eulParentId;
    }

    public void setEulParentId(String eulParentId) {
        this.eulParentId = eulParentId == null ? null : eulParentId.trim();
    }

    public Integer getEulHoldPersons() {
        return eulHoldPersons;
    }

    public void setEulHoldPersons(Integer eulHoldPersons) {
        this.eulHoldPersons = eulHoldPersons;
    }

    public String getEulHoldArea() {
        return eulHoldArea;
    }

    public void setEulHoldArea(String eulHoldArea) {
        this.eulHoldArea = eulHoldArea;
    }

    public String getEuiCode() {
        return euiCode;
    }

    public void setEuiCode(String euiCode) {
        this.euiCode = euiCode == null ? null : euiCode.trim();
    }
}