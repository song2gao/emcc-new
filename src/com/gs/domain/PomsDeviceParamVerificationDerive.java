package com.gs.domain;

public class PomsDeviceParamVerificationDerive {
    private String id;

    private String modelPointId;

    private String dataVerificationId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getModelPointId() {
        return modelPointId;
    }

    public void setModelPointId(String modelPointId) {
        this.modelPointId = modelPointId == null ? null : modelPointId.trim();
    }

    public String getDataVerificationId() {
        return dataVerificationId;
    }

    public void setDataVerificationId(String dataVerificationId) {
        this.dataVerificationId = dataVerificationId == null ? null : dataVerificationId.trim();
    }
}