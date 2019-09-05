package com.gs.domain;

import java.math.BigDecimal;

public class PomsMeasurPointStorage {
    private String id;

    private String mpsStorageTime;

    private String equipmentCodes;

    private String pointCodes;

    private BigDecimal mpsValues;

    private String mpsValuesType;

    private String mpsBackups;

    private byte[] mpsEnterpriseCodes;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMpsStorageTime() {
        return mpsStorageTime;
    }

    public void setMpsStorageTime(String mpsStorageTime) {
        this.mpsStorageTime = mpsStorageTime == null ? null : mpsStorageTime.trim();
    }

    public String getEquipmentCodes() {
        return equipmentCodes;
    }

    public void setEquipmentCodes(String equipmentCodes) {
        this.equipmentCodes = equipmentCodes == null ? null : equipmentCodes.trim();
    }

    public String getPointCodes() {
        return pointCodes;
    }

    public void setPointCodes(String pointCodes) {
        this.pointCodes = pointCodes == null ? null : pointCodes.trim();
    }

    public BigDecimal getMpsValues() {
        return mpsValues;
    }

    public void setMpsValues(BigDecimal mpsValues) {
        this.mpsValues = mpsValues;
    }

    public String getMpsValuesType() {
        return mpsValuesType;
    }

    public void setMpsValuesType(String mpsValuesType) {
        this.mpsValuesType = mpsValuesType == null ? null : mpsValuesType.trim();
    }

    public String getMpsBackups() {
        return mpsBackups;
    }

    public void setMpsBackups(String mpsBackups) {
        this.mpsBackups = mpsBackups == null ? null : mpsBackups.trim();
    }

    public byte[] getMpsEnterpriseCodes() {
        return mpsEnterpriseCodes;
    }

    public void setMpsEnterpriseCodes(byte[] mpsEnterpriseCodes) {
        this.mpsEnterpriseCodes = mpsEnterpriseCodes;
    }
}