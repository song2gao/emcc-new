package com.gs.domain;

public class PomsOperationAssignmentSheet {
    private String id;

    private String umId;
    
    private String umName;

    private String systemLogId;

    private String oasSheetType;

    private String oasProposer;

    private String proposeTime;

    private String proposeContent;

    private String needComplteTime;

    private String oasPriority;

    private String solveContent;

    private String complteTime;

    private String dealStatus;

    private String oasDeviceRefid;

    private String oasDeviceType;

    private String oasBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUmId() {
        return umId;
    }

    public String getUmName() {
		return umName;
	}

	public void setUmName(String umName) {
		this.umName = umName;
	}

	public void setUmId(String umId) {
        this.umId = umId == null ? null : umId.trim();
    }

    public String getSystemLogId() {
        return systemLogId;
    }

    public void setSystemLogId(String systemLogId) {
        this.systemLogId = systemLogId == null ? null : systemLogId.trim();
    }

    public String getOasSheetType() {
        return oasSheetType;
    }

    public void setOasSheetType(String oasSheetType) {
        this.oasSheetType = oasSheetType == null ? null : oasSheetType.trim();
    }

    public String getOasProposer() {
        return oasProposer;
    }

    public void setOasProposer(String oasProposer) {
        this.oasProposer = oasProposer == null ? null : oasProposer.trim();
    }

    public String getProposeTime() {
        return proposeTime;
    }

    public void setProposeTime(String proposeTime) {
        this.proposeTime = proposeTime == null ? null : proposeTime.trim();
    }

    public String getProposeContent() {
        return proposeContent;
    }

    public void setProposeContent(String proposeContent) {
        this.proposeContent = proposeContent == null ? null : proposeContent.trim();
    }

    public String getNeedComplteTime() {
        return needComplteTime;
    }

    public void setNeedComplteTime(String needComplteTime) {
        this.needComplteTime = needComplteTime == null ? null : needComplteTime.trim();
    }

    public String getOasPriority() {
        return oasPriority;
    }

    public void setOasPriority(String oasPriority) {
        this.oasPriority = oasPriority == null ? null : oasPriority.trim();
    }

    public String getSolveContent() {
        return solveContent;
    }

    public void setSolveContent(String solveContent) {
        this.solveContent = solveContent == null ? null : solveContent.trim();
    }

    public String getComplteTime() {
        return complteTime;
    }

    public void setComplteTime(String complteTime) {
        this.complteTime = complteTime == null ? null : complteTime.trim();
    }

    public String getDealStatus() {
        return dealStatus;
    }

    public void setDealStatus(String dealStatus) {
        this.dealStatus = dealStatus == null ? null : dealStatus.trim();
    }

    public String getOasDeviceRefid() {
        return oasDeviceRefid;
    }

    public void setOasDeviceRefid(String oasDeviceRefid) {
        this.oasDeviceRefid = oasDeviceRefid == null ? null : oasDeviceRefid.trim();
    }

    public String getOasDeviceType() {
        return oasDeviceType;
    }

    public void setOasDeviceType(String oasDeviceType) {
        this.oasDeviceType = oasDeviceType == null ? null : oasDeviceType.trim();
    }

    public String getOasBackups() {
        return oasBackups;
    }

    public void setOasBackups(String oasBackups) {
        this.oasBackups = oasBackups == null ? null : oasBackups.trim();
    }
}