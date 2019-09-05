package com.gs.domain;

import java.math.BigDecimal;

public class EsmspEnterpriseDataAnalyseMonth {
    private String id;

    private String euiCode;

    private String industryCode;

    private String governmentDistrictCode;

    private String energyCode;

    private String dateCode;

    private String mmpCode;

    private BigDecimal statisticValue;

    private BigDecimal tongbiVarriablrValue;

    private BigDecimal tongbiVarriablrRate;

    private BigDecimal huanbiVarriableValue;

    private BigDecimal huanbiVarriableRate;

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

    public String getIndustryCode() {
        return industryCode;
    }

    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode == null ? null : industryCode.trim();
    }

    public String getGovernmentDistrictCode() {
        return governmentDistrictCode;
    }

    public void setGovernmentDistrictCode(String governmentDistrictCode) {
        this.governmentDistrictCode = governmentDistrictCode == null ? null : governmentDistrictCode.trim();
    }

    public String getEnergyCode() {
        return energyCode;
    }

    public void setEnergyCode(String energyCode) {
        this.energyCode = energyCode == null ? null : energyCode.trim();
    }

    public String getDateCode() {
        return dateCode;
    }

    public void setDateCode(String dateCode) {
        this.dateCode = dateCode == null ? null : dateCode.trim();
    }

    public String getMmpCode() {
        return mmpCode;
    }

    public void setMmpCode(String mmpCode) {
        this.mmpCode = mmpCode == null ? null : mmpCode.trim();
    }

    public BigDecimal getStatisticValue() {
        return statisticValue;
    }

    public void setStatisticValue(BigDecimal statisticValue) {
        this.statisticValue = statisticValue;
    }

    public BigDecimal getTongbiVarriablrValue() {
        return tongbiVarriablrValue;
    }

    public void setTongbiVarriablrValue(BigDecimal tongbiVarriablrValue) {
        this.tongbiVarriablrValue = tongbiVarriablrValue;
    }

    public BigDecimal getTongbiVarriablrRate() {
        return tongbiVarriablrRate;
    }

    public void setTongbiVarriablrRate(BigDecimal tongbiVarriablrRate) {
        this.tongbiVarriablrRate = tongbiVarriablrRate;
    }

    public BigDecimal getHuanbiVarriableValue() {
        return huanbiVarriableValue;
    }

    public void setHuanbiVarriableValue(BigDecimal huanbiVarriableValue) {
        this.huanbiVarriableValue = huanbiVarriableValue;
    }

    public BigDecimal getHuanbiVarriableRate() {
        return huanbiVarriableRate;
    }

    public void setHuanbiVarriableRate(BigDecimal huanbiVarriableRate) {
        this.huanbiVarriableRate = huanbiVarriableRate;
    }
}