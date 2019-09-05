package com.gs.domain;

public class PomsUnitInfo {
    private String id;

    private String euiCode;

    private String lineCode;

    private String euiName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEuiCode() {
        return euiCode;
    }

    public void setEuiCode(String euiCode) {
        this.euiCode = euiCode == null ? null : euiCode.trim();
    }

    public String getLineCode() {
        return lineCode;
    }

    public void setLineCode(String lineCode) {
        this.lineCode = lineCode == null ? null : lineCode.trim();
    }

    public String getEuiName() {
        return euiName;
    }

    public void setEuiName(String euiName) {
        this.euiName = euiName == null ? null : euiName.trim();
    }
}