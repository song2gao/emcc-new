package com.gs.domain;

import java.math.BigDecimal;

public class PomsMeasurPointDayStorage {
    private String id;

    private String mpdsDate;

    private String mpbsEnterpriseCodes;

    private String mpbsEquipmentCodes;

    private String mpbsPointCodes;

    private BigDecimal mpbsCurval;

    private BigDecimal mpbsIncreval;

    private BigDecimal mpbsMaxval;

    private String mpbsMaxvalTime;

    private BigDecimal mpbsMinval;

    private String mpbsMinvalTime;

    private BigDecimal mpbsAvgval;

    private String mpbsBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMpdsDate() {
        return mpdsDate;
    }

    public void setMpdsDate(String mpdsDate) {
        this.mpdsDate = mpdsDate == null ? null : mpdsDate.trim();
    }

    public String getMpbsEnterpriseCodes() {
        return mpbsEnterpriseCodes;
    }

    public void setMpbsEnterpriseCodes(String mpbsEnterpriseCodes) {
        this.mpbsEnterpriseCodes = mpbsEnterpriseCodes == null ? null : mpbsEnterpriseCodes.trim();
    }

    public String getMpbsEquipmentCodes() {
        return mpbsEquipmentCodes;
    }

    public void setMpbsEquipmentCodes(String mpbsEquipmentCodes) {
        this.mpbsEquipmentCodes = mpbsEquipmentCodes == null ? null : mpbsEquipmentCodes.trim();
    }

    public String getMpbsPointCodes() {
        return mpbsPointCodes;
    }

    public void setMpbsPointCodes(String mpbsPointCodes) {
        this.mpbsPointCodes = mpbsPointCodes == null ? null : mpbsPointCodes.trim();
    }

    public BigDecimal getMpbsCurval() {
        return mpbsCurval;
    }

    public void setMpbsCurval(BigDecimal mpbsCurval) {
        this.mpbsCurval = mpbsCurval;
    }

    public BigDecimal getMpbsIncreval() {
        return mpbsIncreval;
    }

    public void setMpbsIncreval(BigDecimal mpbsIncreval) {
        this.mpbsIncreval = mpbsIncreval;
    }

    public BigDecimal getMpbsMaxval() {
        return mpbsMaxval;
    }

    public void setMpbsMaxval(BigDecimal mpbsMaxval) {
        this.mpbsMaxval = mpbsMaxval;
    }

    public String getMpbsMaxvalTime() {
        return mpbsMaxvalTime;
    }

    public void setMpbsMaxvalTime(String mpbsMaxvalTime) {
        this.mpbsMaxvalTime = mpbsMaxvalTime == null ? null : mpbsMaxvalTime.trim();
    }

    public BigDecimal getMpbsMinval() {
        return mpbsMinval;
    }

    public void setMpbsMinval(BigDecimal mpbsMinval) {
        this.mpbsMinval = mpbsMinval;
    }

    public String getMpbsMinvalTime() {
        return mpbsMinvalTime;
    }

    public void setMpbsMinvalTime(String mpbsMinvalTime) {
        this.mpbsMinvalTime = mpbsMinvalTime == null ? null : mpbsMinvalTime.trim();
    }

    public BigDecimal getMpbsAvgval() {
        return mpbsAvgval;
    }

    public void setMpbsAvgval(BigDecimal mpbsAvgval) {
        this.mpbsAvgval = mpbsAvgval;
    }

    public String getMpbsBackups() {
        return mpbsBackups;
    }

    public void setMpbsBackups(String mpbsBackups) {
        this.mpbsBackups = mpbsBackups == null ? null : mpbsBackups.trim();
    }
}