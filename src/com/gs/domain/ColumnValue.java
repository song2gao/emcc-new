package com.gs.domain;

import java.math.BigDecimal;
import java.util.Map;

public class ColumnValue {
    private String energyType;

    private String dateType;

    private String dateCode;

    private String statisticsType;

    private Map<String,BigDecimal> columnMap;

    private String unit;

    public String getEnergyType() {
        return energyType;
    }

    public void setEnergyType(String energyType) {
        this.energyType = energyType;
    }

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

    public Map<String, BigDecimal> getColumnMap() {
        return columnMap;
    }

    public void setColumnMap(Map<String, BigDecimal> columnMap) {
        this.columnMap = columnMap;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
