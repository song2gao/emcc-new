package com.gs.domain;

public class PomsSystemModelParam {
    private String id;

    private String systemModelId;

    private String modelParamName;

    private String modelParamVal;

    private String modelParamBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSystemModelId() {
        return systemModelId;
    }

    public void setSystemModelId(String systemModelId) {
        this.systemModelId = systemModelId == null ? null : systemModelId.trim();
    }

    public String getModelParamName() {
        return modelParamName;
    }

    public void setModelParamName(String modelParamName) {
        this.modelParamName = modelParamName == null ? null : modelParamName.trim();
    }

    public String getModelParamVal() {
        return modelParamVal;
    }

    public void setModelParamVal(String modelParamVal) {
        this.modelParamVal = modelParamVal == null ? null : modelParamVal.trim();
    }

    public String getModelParamBackups() {
        return modelParamBackups;
    }

    public void setModelParamBackups(String modelParamBackups) {
        this.modelParamBackups = modelParamBackups == null ? null : modelParamBackups.trim();
    }
}