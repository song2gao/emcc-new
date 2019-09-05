package com.gs.domain;

import java.math.BigDecimal;

public class ICDayLine {

    private String energyCode;

    private String statisticsType;

    private String statisticsCode;

    private String dateCode;

    private String flag;

    public BigDecimal[] getYestoday() {
        return yestoday;
    }

    public void setYestoday(BigDecimal[] yestoday) {
        this.yestoday = yestoday;
    }

    public BigDecimal[] getToday() {
        return today;
    }

    public void setToday(BigDecimal[] today) {
        this.today = today;
    }

    private BigDecimal[] yestoday;

    private BigDecimal[] today;

    private BigDecimal maxValue;

    private BigDecimal minValue;

    private BigDecimal avgValue;

    private double sumValue;

    private BigDecimal fValue;

    private BigDecimal pValue;

    private BigDecimal gValue;

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    private String unit;

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


    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public BigDecimal getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(BigDecimal maxValue) {
        this.maxValue = maxValue;
    }

    public BigDecimal getMinValue() {
        return minValue;
    }

    public void setMinValue(BigDecimal minValue) {
        this.minValue = minValue;
    }

    public BigDecimal getAvgValue() {
        return avgValue;
    }

    public void setAvgValue(BigDecimal avgValue) {
        this.avgValue = avgValue;
    }

    public double getSumValue() {
        return sumValue;
    }

    public void setSumValue(double sumValue) {
        this.sumValue = sumValue;
    }

    public BigDecimal getfValue() {
        return fValue;
    }

    public void setfValue(BigDecimal fValue) {
        this.fValue = fValue;
    }

    public BigDecimal getpValue() {
        return pValue;
    }

    public void setpValue(BigDecimal pValue) {
        this.pValue = pValue;
    }

    public BigDecimal getgValue() {
        return gValue;
    }

    public void setgValue(BigDecimal gValue) {
        this.gValue = gValue;
    }

    public String getStatisticsType() {
        return statisticsType;
    }

    public void setStatisticsType(String statisticsType) {
        this.statisticsType = statisticsType;
    }

    public String getStatisticsCode() {
        return statisticsCode;
    }

    public void setStatisticsCode(String statisticsCode) {
        this.statisticsCode = statisticsCode;
    }
}
