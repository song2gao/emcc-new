package com.gs.domain;

public class EsmspUserRechargeRecord {
    private String recordId;

    private String userId;
    
    private String userTel;

    private String userAddress;


    private Float recordAmount;

    private Float amounts;

    private String recordTime;

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Float getRecordAmount() {
        return recordAmount;
    }

    public void setRecordAmount(Float recordAmount) {
        this.recordAmount = recordAmount;
    }

    public Float getAmounts() {
        return amounts;
    }

    public void setAmounts(Float amounts) {
        this.amounts = amounts;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime == null ? null : recordTime.trim();
    }

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
    
}