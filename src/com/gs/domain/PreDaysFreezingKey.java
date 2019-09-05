package com.gs.domain;

import java.util.Date;

public class PreDaysFreezingKey {
    private String daysFreezingMsaCodes;

    private String daysFreezingEquipmentCodes;

    private String daysFreezingPointCodes;

    private Date daysFreezingStorageDate;

    public String getDaysFreezingMsaCodes() {
        return daysFreezingMsaCodes;
    }

    public void setDaysFreezingMsaCodes(String daysFreezingMsaCodes) {
        this.daysFreezingMsaCodes = daysFreezingMsaCodes == null ? null : daysFreezingMsaCodes.trim();
    }

    public String getDaysFreezingEquipmentCodes() {
        return daysFreezingEquipmentCodes;
    }

    public void setDaysFreezingEquipmentCodes(String daysFreezingEquipmentCodes) {
        this.daysFreezingEquipmentCodes = daysFreezingEquipmentCodes == null ? null : daysFreezingEquipmentCodes.trim();
    }

    public String getDaysFreezingPointCodes() {
        return daysFreezingPointCodes;
    }

    public void setDaysFreezingPointCodes(String daysFreezingPointCodes) {
        this.daysFreezingPointCodes = daysFreezingPointCodes == null ? null : daysFreezingPointCodes.trim();
    }

    public Date getDaysFreezingStorageDate() {
        return daysFreezingStorageDate;
    }

    public void setDaysFreezingStorageDate(Date daysFreezingStorageDate) {
        this.daysFreezingStorageDate = daysFreezingStorageDate;
    }
}