package com.gs.domain;

import java.math.BigDecimal;

public class EsmspEnergySavingRunReport {
    private String id;

    private String esrrDistrictCode;

    private String esrrIndustryCode;

    private String esrrEnergyUnitCode;

    private String esrrSavingReport;

    private String esrrEditTime;

    private String esrrReportStartTime;

    private String esrrReportEndTime;

    private String esrrEditingUnit;

    private String esrrDeviceId;

    private String esrrDeviceName;

    private BigDecimal esrrSavingRate;

    private BigDecimal esrrSavingQuantity;

    private BigDecimal esrrPredicSavingPower;

    private BigDecimal esrrPredicSavingFee;

    private String esrrPredicStartTime;

    private String esrrProjectType;

    private BigDecimal esrrProjectVestEstimate;

    private String esrrSavingTechnology;

    private BigDecimal esrrSavingQuantityReal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEsrrDistrictCode() {
        return esrrDistrictCode;
    }

    public void setEsrrDistrictCode(String esrrDistrictCode) {
        this.esrrDistrictCode = esrrDistrictCode == null ? null : esrrDistrictCode.trim();
    }

    public String getEsrrIndustryCode() {
        return esrrIndustryCode;
    }

    public void setEsrrIndustryCode(String esrrIndustryCode) {
        this.esrrIndustryCode = esrrIndustryCode == null ? null : esrrIndustryCode.trim();
    }

    public String getEsrrEnergyUnitCode() {
        return esrrEnergyUnitCode;
    }

    public void setEsrrEnergyUnitCode(String esrrEnergyUnitCode) {
        this.esrrEnergyUnitCode = esrrEnergyUnitCode == null ? null : esrrEnergyUnitCode.trim();
    }

    public String getEsrrSavingReport() {
        return esrrSavingReport;
    }

    public void setEsrrSavingReport(String esrrSavingReport) {
        this.esrrSavingReport = esrrSavingReport == null ? null : esrrSavingReport.trim();
    }

    public String getEsrrEditTime() {
        return esrrEditTime;
    }

    public void setEsrrEditTime(String esrrEditTime) {
        this.esrrEditTime = esrrEditTime == null ? null : esrrEditTime.trim();
    }

    public String getEsrrReportStartTime() {
        return esrrReportStartTime;
    }

    public void setEsrrReportStartTime(String esrrReportStartTime) {
        this.esrrReportStartTime = esrrReportStartTime == null ? null : esrrReportStartTime.trim();
    }

    public String getEsrrReportEndTime() {
        return esrrReportEndTime;
    }

    public void setEsrrReportEndTime(String esrrReportEndTime) {
        this.esrrReportEndTime = esrrReportEndTime == null ? null : esrrReportEndTime.trim();
    }

    public String getEsrrEditingUnit() {
        return esrrEditingUnit;
    }

    public void setEsrrEditingUnit(String esrrEditingUnit) {
        this.esrrEditingUnit = esrrEditingUnit == null ? null : esrrEditingUnit.trim();
    }

    public String getEsrrDeviceId() {
        return esrrDeviceId;
    }

    public void setEsrrDeviceId(String esrrDeviceId) {
        this.esrrDeviceId = esrrDeviceId == null ? null : esrrDeviceId.trim();
    }

    public String getEsrrDeviceName() {
        return esrrDeviceName;
    }

    public void setEsrrDeviceName(String esrrDeviceName) {
        this.esrrDeviceName = esrrDeviceName == null ? null : esrrDeviceName.trim();
    }

    public BigDecimal getEsrrSavingRate() {
        return esrrSavingRate;
    }

    public void setEsrrSavingRate(BigDecimal esrrSavingRate) {
        this.esrrSavingRate = esrrSavingRate;
    }

    public BigDecimal getEsrrSavingQuantity() {
        return esrrSavingQuantity;
    }

    public void setEsrrSavingQuantity(BigDecimal esrrSavingQuantity) {
        this.esrrSavingQuantity = esrrSavingQuantity;
    }

    public BigDecimal getEsrrPredicSavingPower() {
        return esrrPredicSavingPower;
    }

    public void setEsrrPredicSavingPower(BigDecimal esrrPredicSavingPower) {
        this.esrrPredicSavingPower = esrrPredicSavingPower;
    }

    public BigDecimal getEsrrPredicSavingFee() {
        return esrrPredicSavingFee;
    }

    public void setEsrrPredicSavingFee(BigDecimal esrrPredicSavingFee) {
        this.esrrPredicSavingFee = esrrPredicSavingFee;
    }

    public String getEsrrPredicStartTime() {
        return esrrPredicStartTime;
    }

    public void setEsrrPredicStartTime(String esrrPredicStartTime) {
        this.esrrPredicStartTime = esrrPredicStartTime == null ? null : esrrPredicStartTime.trim();
    }

    public String getEsrrProjectType() {
        return esrrProjectType;
    }

    public void setEsrrProjectType(String esrrProjectType) {
        this.esrrProjectType = esrrProjectType == null ? null : esrrProjectType.trim();
    }

    public BigDecimal getEsrrProjectVestEstimate() {
        return esrrProjectVestEstimate;
    }

    public void setEsrrProjectVestEstimate(BigDecimal esrrProjectVestEstimate) {
        this.esrrProjectVestEstimate = esrrProjectVestEstimate;
    }

    public String getEsrrSavingTechnology() {
        return esrrSavingTechnology;
    }

    public void setEsrrSavingTechnology(String esrrSavingTechnology) {
        this.esrrSavingTechnology = esrrSavingTechnology == null ? null : esrrSavingTechnology.trim();
    }

    public BigDecimal getEsrrSavingQuantityReal() {
        return esrrSavingQuantityReal;
    }

    public void setEsrrSavingQuantityReal(BigDecimal esrrSavingQuantityReal) {
        this.esrrSavingQuantityReal = esrrSavingQuantityReal;
    }
}