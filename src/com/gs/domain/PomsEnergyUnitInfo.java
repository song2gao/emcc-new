package com.gs.domain;

import java.math.BigDecimal;

public class PomsEnergyUnitInfo {
    private String id;

    private String euiCode;

    private String euiNames;

    private String euiRepresentative;

    private String euiBelongIndustry;

    private String euiBelongDistrct;

    private String euiConsumeBand;

    private String euiChargeDepartment;

    private String euiLocation;

    private String euiContentWay;

    private BigDecimal euiBuildingArea;

    private Integer euiHoldPerson;

    private String euiBackups;

    private String euiParentid;

    private String euiReferenceDevice;

    private String euiReferenceDeviceName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEuiCode() {
        return euiCode;
    }

    public void setEuiCode(String euiCode) {
        this.euiCode = euiCode == null ? null : euiCode.trim();
    }

    public String getEuiNames() {
        return euiNames;
    }

    public void setEuiNames(String euiNames) {
        this.euiNames = euiNames == null ? null : euiNames.trim();
    }

    public String getEuiRepresentative() {
        return euiRepresentative;
    }

    public void setEuiRepresentative(String euiRepresentative) {
        this.euiRepresentative = euiRepresentative == null ? null : euiRepresentative.trim();
    }

    public String getEuiBelongIndustry() {
        return euiBelongIndustry;
    }

    public void setEuiBelongIndustry(String euiBelongIndustry) {
        this.euiBelongIndustry = euiBelongIndustry == null ? null : euiBelongIndustry.trim();
    }

    public String getEuiBelongDistrct() {
        return euiBelongDistrct;
    }

    public void setEuiBelongDistrct(String euiBelongDistrct) {
        this.euiBelongDistrct = euiBelongDistrct == null ? null : euiBelongDistrct.trim();
    }

    public String getEuiConsumeBand() {
        return euiConsumeBand;
    }

    public void setEuiConsumeBand(String euiConsumeBand) {
        this.euiConsumeBand = euiConsumeBand == null ? null : euiConsumeBand.trim();
    }

    public String getEuiChargeDepartment() {
        return euiChargeDepartment;
    }

    public void setEuiChargeDepartment(String euiChargeDepartment) {
        this.euiChargeDepartment = euiChargeDepartment == null ? null : euiChargeDepartment.trim();
    }

    public String getEuiLocation() {
        return euiLocation;
    }

    public void setEuiLocation(String euiLocation) {
        this.euiLocation = euiLocation == null ? null : euiLocation.trim();
    }

    public String getEuiContentWay() {
        return euiContentWay;
    }

    public void setEuiContentWay(String euiContentWay) {
        this.euiContentWay = euiContentWay == null ? null : euiContentWay.trim();
    }

    public BigDecimal getEuiBuildingArea() {
        return euiBuildingArea;
    }

    public void setEuiBuildingArea(BigDecimal euiBuildingArea) {
        this.euiBuildingArea = euiBuildingArea;
    }

    public Integer getEuiHoldPerson() {
        return euiHoldPerson;
    }

    public void setEuiHoldPerson(Integer euiHoldPerson) {
        this.euiHoldPerson = euiHoldPerson;
    }

    public String getEuiBackups() {
        return euiBackups;
    }

    public void setEuiBackups(String euiBackups) {
        this.euiBackups = euiBackups == null ? null : euiBackups.trim();
    }

    public String getEuiParentid() {
        return euiParentid;
    }

    public void setEuiParentid(String euiParentid) {
        this.euiParentid = euiParentid == null ? null : euiParentid.trim();
    }

    public String getEuiReferenceDevice() {
        return euiReferenceDevice;
    }

    public void setEuiReferenceDevice(String euiReferenceDevice) {
        this.euiReferenceDevice = euiReferenceDevice == null ? null : euiReferenceDevice.trim();
    }

    public String getEuiReferenceDeviceName() {
        return euiReferenceDeviceName;
    }

    public void setEuiReferenceDeviceName(String euiReferenceDeviceName) {
        this.euiReferenceDeviceName = euiReferenceDeviceName == null ? null : euiReferenceDeviceName.trim();
    }
}