package com.gs.domain;

public class EsmspUserRights {
    private String rightsId;

    private String rightsName;

    private String rightsStyle;

    public String getRightsId() {
        return rightsId;
    }

    public void setRightsId(String rightsId) {
        this.rightsId = rightsId == null ? null : rightsId.trim();
    }

    public String getRightsName() {
        return rightsName;
    }

    public void setRightsName(String rightsName) {
        this.rightsName = rightsName == null ? null : rightsName.trim();
    }

    public String getRightsStyle() {
        return rightsStyle;
    }

    public void setRightsStyle(String rightsStyle) {
        this.rightsStyle = rightsStyle == null ? null : rightsStyle.trim();
    }
}