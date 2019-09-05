package com.gs.domain;

public class EsmspUserRechargeDetail {
    private String detailId;

    private String userId;
    
    private String userTel;
    
    private String month;

    private Integer energyType;

    private Float moduleAmount;

    private Float allAmount;

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId == null ? null : detailId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

    public Integer getEnergyType() {
        return energyType;
    }

    public void setEnergyType(Integer energyType) {
        this.energyType = energyType;
    }

    public Float getModuleAmount() {
        return moduleAmount;
    }

    public void setModuleAmount(Float moduleAmount) {
        this.moduleAmount = moduleAmount;
    }

    public Float getAllAmount() {
        return allAmount;
    }

    public void setAllAmount(Float allAmount) {
        this.allAmount = allAmount;
    }

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
    
    
}