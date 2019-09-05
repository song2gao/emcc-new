package com.gs.domain;

import java.math.BigDecimal;

public class ICSumValue {


   private String dateType;

   private String dateCode;

   private String statisticsType;

   private String statisticsCode;

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
    }

    public String getDateCode() {
        return dateCode;
    }

    public void setDateCode(String dateCode) {
        this.dateCode = dateCode;
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

    private BigDecimal eSumValue;

    private BigDecimal wSumValue;

    private BigDecimal fSumValue;

    private BigDecimal cSumValue;

    private String cUnit;

    public BigDecimal getcSumValue() {
        return cSumValue;
    }

    public void setcSumValue(BigDecimal cSumValue) {
        this.cSumValue = cSumValue;
    }

    public String getcUnit() {
        return cUnit;
    }

    public void setcUnit(String cUnit) {
        this.cUnit = cUnit;
    }

    private String eUnit;

   private String wUnit;

   private String fUnit;

    public BigDecimal geteSumValue() {
        return eSumValue;
    }

    public void seteSumValue(BigDecimal eSumValue) {
        this.eSumValue = eSumValue;
    }

    public BigDecimal getwSumValue() {
        return wSumValue;
    }

    public void setwSumValue(BigDecimal wSumValue) {
        this.wSumValue = wSumValue;
    }

    public BigDecimal getfSumValue() {
        return fSumValue;
    }

    public void setfSumValue(BigDecimal fSumValue) {
        this.fSumValue = fSumValue;
    }

    public String geteUnit() {
        return eUnit;
    }

    public void seteUnit(String eUnit) {
        this.eUnit = eUnit;
    }

    public String getwUnit() {
        return wUnit;
    }

    public void setwUnit(String wUnit) {
        this.wUnit = wUnit;
    }

    public String getfUnit() {
        return fUnit;
    }

    public void setfUnit(String fUnit) {
        this.fUnit = fUnit;
    }
}
