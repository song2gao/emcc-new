package com.gs.domain;

import java.util.ArrayList;
import java.util.List;


public class PomsModulesManagement {
    private String id;

    private String mmModuleName;

    private String mmModuleCode;

    private String parentMmId;

    private String mmModulePic;

    private String mmModuleUrl;

    private String mmModuleDescription;

    private String mmModuleBackups;

    private String mmModuleOrders;

    private String mmModuleProperty;
    
    private List<PomsModulesManagement> children = new ArrayList<PomsModulesManagement>();

    public String getId() {
        return id;
    }

    public List<PomsModulesManagement> getChildren() {
		return children;
	}

	public void setChildren(List<PomsModulesManagement> children) {
		this.children = children;
	}

	public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMmModuleName() {
        return mmModuleName;
    }

    public void setMmModuleName(String mmModuleName) {
        this.mmModuleName = mmModuleName == null ? null : mmModuleName.trim();
    }

    public String getMmModuleCode() {
        return mmModuleCode;
    }

    public void setMmModuleCode(String mmModuleCode) {
        this.mmModuleCode = mmModuleCode == null ? null : mmModuleCode.trim();
    }

    public String getParentMmId() {
        return parentMmId;
    }

    public void setParentMmId(String parentMmId) {
        this.parentMmId = parentMmId == null ? null : parentMmId.trim();
    }

    public String getMmModulePic() {
        return mmModulePic;
    }

    public void setMmModulePic(String mmModulePic) {
        this.mmModulePic = mmModulePic == null ? null : mmModulePic.trim();
    }

    public String getMmModuleUrl() {
        return mmModuleUrl;
    }

    public void setMmModuleUrl(String mmModuleUrl) {
        this.mmModuleUrl = mmModuleUrl == null ? null : mmModuleUrl.trim();
    }

    public String getMmModuleDescription() {
        return mmModuleDescription;
    }

    public void setMmModuleDescription(String mmModuleDescription) {
        this.mmModuleDescription = mmModuleDescription == null ? null : mmModuleDescription.trim();
    }

    public String getMmModuleBackups() {
        return mmModuleBackups;
    }

    public void setMmModuleBackups(String mmModuleBackups) {
        this.mmModuleBackups = mmModuleBackups == null ? null : mmModuleBackups.trim();
    }

    public String getMmModuleOrders() {
        return mmModuleOrders;
    }

    public void setMmModuleOrders(String mmModuleOrders) {
        this.mmModuleOrders = mmModuleOrders == null ? null : mmModuleOrders.trim();
    }

    public String getMmModuleProperty() {
        return mmModuleProperty;
    }

    public void setMmModuleProperty(String mmModuleProperty) {
        this.mmModuleProperty = mmModuleProperty == null ? null : mmModuleProperty.trim();
    }
}