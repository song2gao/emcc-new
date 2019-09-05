package com.gs.domain;

import java.math.BigDecimal;

public class PomsMeasurPointHourStorage {
    private String id;

    private String mphsDate;

    private String mphsEnterpriseCodes;

    private String mphsEquipmentCodes;

    private String mphsPointCodes;

    private BigDecimal mphsCurval;

    private BigDecimal mphsIncreval;

    private BigDecimal mphsMaxval;

    private String mphsMaxvalTime;

    private String mphsMinvalTime;

    private BigDecimal mphsMinval;

    private BigDecimal mphsAvgval;

    private String mphsBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMphsDate() {
        return mphsDate;
    }

    public void setMphsDate(String mphsDate) {
        this.mphsDate = mphsDate == null ? null : mphsDate.trim();
    }

    public String getMphsEnterpriseCodes() {
        return mphsEnterpriseCodes;
    }

    public void setMphsEnterpriseCodes(String mphsEnterpriseCodes) {
        this.mphsEnterpriseCodes = mphsEnterpriseCodes == null ? null : mphsEnterpriseCodes.trim();
    }

    public String getMphsEquipmentCodes() {
        return mphsEquipmentCodes;
    }

    public void setMphsEquipmentCodes(String mphsEquipmentCodes) {
        this.mphsEquipmentCodes = mphsEquipmentCodes == null ? null : mphsEquipmentCodes.trim();
    }

    public String getMphsPointCodes() {
        return mphsPointCodes;
    }

    public void setMphsPointCodes(String mphsPointCodes) {
        this.mphsPointCodes = mphsPointCodes == null ? null : mphsPointCodes.trim();
    }

    public BigDecimal getMphsCurval() {
        return mphsCurval;
    }

    public void setMphsCurval(BigDecimal mphsCurval) {
        this.mphsCurval = mphsCurval;
    }

    public BigDecimal getMphsIncreval() {
        return mphsIncreval;
    }

    public void setMphsIncreval(BigDecimal mphsIncreval) {
        this.mphsIncreval = mphsIncreval;
    }

    public BigDecimal getMphsMaxval() {
        return mphsMaxval;
    }

    public void setMphsMaxval(BigDecimal mphsMaxval) {
        this.mphsMaxval = mphsMaxval;
    }

    public String getMphsMaxvalTime() {
        return mphsMaxvalTime;
    }

    public void setMphsMaxvalTime(String mphsMaxvalTime) {
        this.mphsMaxvalTime = mphsMaxvalTime == null ? null : mphsMaxvalTime.trim();
    }

    public String getMphsMinvalTime() {
        return mphsMinvalTime;
    }

    public void setMphsMinvalTime(String mphsMinvalTime) {
        this.mphsMinvalTime = mphsMinvalTime == null ? null : mphsMinvalTime.trim();
    }

    public BigDecimal getMphsMinval() {
        return mphsMinval;
    }

    public void setMphsMinval(BigDecimal mphsMinval) {
        this.mphsMinval = mphsMinval;
    }

    public BigDecimal getMphsAvgval() {
        return mphsAvgval;
    }

    public void setMphsAvgval(BigDecimal mphsAvgval) {
        this.mphsAvgval = mphsAvgval;
    }

    public String getMphsBackups() {
        return mphsBackups;
    }

    public void setMphsBackups(String mphsBackups) {
        this.mphsBackups = mphsBackups == null ? null : mphsBackups.trim();
    }
}