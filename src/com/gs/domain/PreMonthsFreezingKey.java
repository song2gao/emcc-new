package com.gs.domain;

import java.util.Date;

public class PreMonthsFreezingKey {
    private String monthsFreezingMsaCodes;

    private String monthsFreezingEquipmentCodes;

    private String monthsFreezingPointCodes;

    private Date monthsFreezingStorageDate;

    public String getMonthsFreezingMsaCodes() {
        return monthsFreezingMsaCodes;
    }

    public void setMonthsFreezingMsaCodes(String monthsFreezingMsaCodes) {
        this.monthsFreezingMsaCodes = monthsFreezingMsaCodes == null ? null : monthsFreezingMsaCodes.trim();
    }

    public String getMonthsFreezingEquipmentCodes() {
        return monthsFreezingEquipmentCodes;
    }

    public void setMonthsFreezingEquipmentCodes(String monthsFreezingEquipmentCodes) {
        this.monthsFreezingEquipmentCodes = monthsFreezingEquipmentCodes == null ? null : monthsFreezingEquipmentCodes.trim();
    }

    public String getMonthsFreezingPointCodes() {
        return monthsFreezingPointCodes;
    }

    public void setMonthsFreezingPointCodes(String monthsFreezingPointCodes) {
        this.monthsFreezingPointCodes = monthsFreezingPointCodes == null ? null : monthsFreezingPointCodes.trim();
    }

    public Date getMonthsFreezingStorageDate() {
        return monthsFreezingStorageDate;
    }

    public void setMonthsFreezingStorageDate(Date monthsFreezingStorageDate) {
        this.monthsFreezingStorageDate = monthsFreezingStorageDate;
    }
}