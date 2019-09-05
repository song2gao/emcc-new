package com.gs.domain;

public class PomsEnergyUsingFacilities {
    private String id;

    private String energySystemId;

    private String facilitiesName;

    private String systemModelId;

    private String fufBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEnergySystemId() {
        return energySystemId;
    }

    public void setEnergySystemId(String energySystemId) {
        this.energySystemId = energySystemId == null ? null : energySystemId.trim();
    }

    public String getFacilitiesName() {
        return facilitiesName;
    }

    public void setFacilitiesName(String facilitiesName) {
        this.facilitiesName = facilitiesName == null ? null : facilitiesName.trim();
    }

    public String getSystemModelId() {
        return systemModelId;
    }

    public void setSystemModelId(String systemModelId) {
        this.systemModelId = systemModelId == null ? null : systemModelId.trim();
    }

    public String getFufBackups() {
        return fufBackups;
    }

    public void setFufBackups(String fufBackups) {
        this.fufBackups = fufBackups == null ? null : fufBackups.trim();
    }
}