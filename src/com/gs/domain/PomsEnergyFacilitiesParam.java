package com.gs.domain;

import java.math.BigDecimal;

public class PomsEnergyFacilitiesParam {
    private String id;

    private String energyFacilitiesId;

    private String facilitiesParamName;

    private BigDecimal facilitiesParamVal;

    private String facilitiesBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEnergyFacilitiesId() {
        return energyFacilitiesId;
    }

    public void setEnergyFacilitiesId(String energyFacilitiesId) {
        this.energyFacilitiesId = energyFacilitiesId == null ? null : energyFacilitiesId.trim();
    }

    public String getFacilitiesParamName() {
        return facilitiesParamName;
    }

    public void setFacilitiesParamName(String facilitiesParamName) {
        this.facilitiesParamName = facilitiesParamName == null ? null : facilitiesParamName.trim();
    }

    public BigDecimal getFacilitiesParamVal() {
        return facilitiesParamVal;
    }

    public void setFacilitiesParamVal(BigDecimal facilitiesParamVal) {
        this.facilitiesParamVal = facilitiesParamVal;
    }

    public String getFacilitiesBackups() {
        return facilitiesBackups;
    }

    public void setFacilitiesBackups(String facilitiesBackups) {
        this.facilitiesBackups = facilitiesBackups == null ? null : facilitiesBackups.trim();
    }
}