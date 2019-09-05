package com.gs.domain;

public class PomsEnergySystemParam {
    private String id;

    private String energySystemId;
    
    private String espParamCode;

    public String getEspParamCode() {
		return espParamCode;
	}

	public void setEspParamCode(String espParamCode) {
		this.espParamCode = espParamCode;
	}

	private String espParamName;

    private String espCtdCode;

    private String espMmpCode;

    private String espMmpUnit;

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

    public String getEspParamName() {
        return espParamName;
    }

    public void setEspParamName(String espParamName) {
        this.espParamName = espParamName == null ? null : espParamName.trim();
    }

    public String getEspCtdCode() {
        return espCtdCode;
    }

    public void setEspCtdCode(String espCtdCode) {
        this.espCtdCode = espCtdCode == null ? null : espCtdCode.trim();
    }

    public String getEspMmpCode() {
        return espMmpCode;
    }

    public void setEspMmpCode(String espMmpCode) {
        this.espMmpCode = espMmpCode == null ? null : espMmpCode.trim();
    }

    public String getEspMmpUnit() {
        return espMmpUnit;
    }

    public void setEspMmpUnit(String espMmpUnit) {
        this.espMmpUnit = espMmpUnit == null ? null : espMmpUnit.trim();
    }
}