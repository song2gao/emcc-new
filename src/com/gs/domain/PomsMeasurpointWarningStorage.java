package com.gs.domain;

import java.math.BigDecimal;

public class PomsMeasurpointWarningStorage {
    private String id;

    private String mpwsDate;

    private String mpbsEnterpriseCode;

    private String mpbsEquipmentCode;

    private String mpbsPointCode;

    private BigDecimal mpbsCurval;

    private String mpbsCurvalType;

    private BigDecimal mpbsWarningVal;

    private String mpbsDateType;

    private String mpbsBackup;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMpwsDate() {
        return mpwsDate;
    }

    public void setMpwsDate(String mpwsDate) {
        this.mpwsDate = mpwsDate == null ? null : mpwsDate.trim();
    }

    public String getMpbsEnterpriseCode() {
        return mpbsEnterpriseCode;
    }

    public void setMpbsEnterpriseCode(String mpbsEnterpriseCode) {
        this.mpbsEnterpriseCode = mpbsEnterpriseCode == null ? null : mpbsEnterpriseCode.trim();
    }

    public String getMpbsEquipmentCode() {
        return mpbsEquipmentCode;
    }

    public void setMpbsEquipmentCode(String mpbsEquipmentCode) {
        this.mpbsEquipmentCode = mpbsEquipmentCode == null ? null : mpbsEquipmentCode.trim();
    }

    public String getMpbsPointCode() {
        return mpbsPointCode;
    }

    public void setMpbsPointCode(String mpbsPointCode) {
        this.mpbsPointCode = mpbsPointCode == null ? null : mpbsPointCode.trim();
    }

    public BigDecimal getMpbsCurval() {
        return mpbsCurval;
    }

    public void setMpbsCurval(BigDecimal mpbsCurval) {
        this.mpbsCurval = mpbsCurval;
    }

    public String getMpbsCurvalType() {
        return mpbsCurvalType;
    }

    public void setMpbsCurvalType(String mpbsCurvalType) {
        this.mpbsCurvalType = mpbsCurvalType == null ? null : mpbsCurvalType.trim();
    }

    public BigDecimal getMpbsWarningVal() {
        return mpbsWarningVal;
    }

    public void setMpbsWarningVal(BigDecimal mpbsWarningVal) {
        this.mpbsWarningVal = mpbsWarningVal;
    }

    public String getMpbsDateType() {
        return mpbsDateType;
    }

    public void setMpbsDateType(String mpbsDateType) {
        this.mpbsDateType = mpbsDateType == null ? null : mpbsDateType.trim();
    }

    public String getMpbsBackup() {
        return mpbsBackup;
    }

    public void setMpbsBackup(String mpbsBackup) {
        this.mpbsBackup = mpbsBackup == null ? null : mpbsBackup.trim();
    }
}