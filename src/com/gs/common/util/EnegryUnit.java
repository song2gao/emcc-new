package com.gs.common.util;

import com.gs.domain.PomsFrontProcessorConfig;


public class EnegryUnit {
	/*用能单位信息*/
	private String id;
	private String euiCode;
	private String euiNames;
	private String euiRepresentative;
	private String euiBelongIndustry;
	private String euiBelongDistrct;
	private String euiConsumeBand;
	private String euiChargeDepartment;
	private String euiLocation;
	private String euiContentWay;
	private Double euiBuildingArea;
	private Integer euiHoldPerson;
	private String euiBackups;
	private String euiParentid;
	private String parentName;
	
	private String euiBelongIndustry1;
	private String euiBelongDistrct1;
	
	
	
	public String getEuiBelongIndustry1() {
		return euiBelongIndustry1;
	}

	public void setEuiBelongIndustry1(String euiBelongIndustry1) {
		this.euiBelongIndustry1 = euiBelongIndustry1;
	}

	public String getEuiBelongDistrct1() {
		return euiBelongDistrct1;
	}

	public void setEuiBelongDistrct1(String euiBelongDistrct1) {
		this.euiBelongDistrct1 = euiBelongDistrct1;
	}
	/*采集终端信息*/
	private String asstdCode;
	private String asstdNames;
	private String asstdRunStatus;
	private String asstdProduction;
	private String asstdAssembleIp;
	private String asstdBackups;
	private PomsFrontProcessorConfig pomsFrontProcessorConfig; //前置机外键
	private String crcAssembleIp; //采集器IP
	private String crcCommunicateType; //通讯类型
	private String crcCommunicateSerial; //采集器序号
	
	// Constructors

	public PomsFrontProcessorConfig getPomsFrontProcessorConfig() {
		return pomsFrontProcessorConfig;
	}

	public void setPomsFrontProcessorConfig(
			PomsFrontProcessorConfig pomsFrontProcessorConfig) {
		this.pomsFrontProcessorConfig = pomsFrontProcessorConfig;
	}

	public String getCrcAssembleIp() {
		return crcAssembleIp;
	}

	public void setCrcAssembleIp(String crcAssembleIp) {
		this.crcAssembleIp = crcAssembleIp;
	}

	public String getCrcCommunicateType() {
		return crcCommunicateType;
	}

	public void setCrcCommunicateType(String crcCommunicateType) {
		this.crcCommunicateType = crcCommunicateType;
	}

	public String getCrcCommunicateSerial() {
		return crcCommunicateSerial;
	}

	public void setCrcCommunicateSerial(String crcCommunicateSerial) {
		this.crcCommunicateSerial = crcCommunicateSerial;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getEuiParentid() {
		return euiParentid;
	}

	public void setEuiParentid(String euiParentid) {
		this.euiParentid = euiParentid;
	}

	public String getAsstdCode() {
		return asstdCode;
	}

	public void setAsstdCode(String asstdCode) {
		this.asstdCode = asstdCode;
	}

	public String getAsstdNames() {
		return asstdNames;
	}

	public void setAsstdNames(String asstdNames) {
		this.asstdNames = asstdNames;
	}

	public String getAsstdRunStatus() {
		return asstdRunStatus;
	}

	public void setAsstdRunStatus(String asstdRunStatus) {
		this.asstdRunStatus = asstdRunStatus;
	}

	public String getAsstdProduction() {
		return asstdProduction;
	}

	public void setAsstdProduction(String asstdProduction) {
		this.asstdProduction = asstdProduction;
	}

	public String getAsstdBackups() {
		return asstdBackups;
	}

	public void setAsstdBackups(String asstdBackups) {
		this.asstdBackups = asstdBackups;
	}
	

	public String getAsstdAssembleIp() {
		return asstdAssembleIp;
	}

	public void setAsstdAssembleIp(String asstdAssembleIp) {
		this.asstdAssembleIp = asstdAssembleIp;
	}

	/** default constructor */
	public EnegryUnit() {
	}

	/** minimal constructor */
	public EnegryUnit(String id) {
		this.id = id;
	}

	/** full constructor */
	public EnegryUnit(String id, String euiCode,
			String euiNames, String euiRepresentative,
			String euiBelongIndustry, String euiBelongDistrct,
			String euiConsumeBand, String euiChargeDepartment,
			String euiLocation, String euiContentWay, Double euiBuildingArea,
			Integer euiHoldPerson, String euiBackups,String euiParentid) {
		this.id = id;
		this.euiCode = euiCode;
		this.euiNames = euiNames;
		this.euiRepresentative = euiRepresentative;
		this.euiBelongIndustry = euiBelongIndustry;
		this.euiBelongDistrct = euiBelongDistrct;
		this.euiConsumeBand = euiConsumeBand;
		this.euiChargeDepartment = euiChargeDepartment;
		this.euiLocation = euiLocation;
		this.euiContentWay = euiContentWay;
		this.euiBuildingArea = euiBuildingArea;
		this.euiHoldPerson = euiHoldPerson;
		this.euiBackups = euiBackups;
		this.euiParentid=euiParentid;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEuiCode() {
		return euiCode;
	}
	public void setEuiCode(String euiCode) {
		this.euiCode = euiCode;
	}
	public String getEuiNames() {
		return euiNames;
	}
	public void setEuiNames(String euiNames) {
		this.euiNames = euiNames;
	}
	public String getEuiRepresentative() {
		return euiRepresentative;
	}
	public void setEuiRepresentative(String euiRepresentative) {
		this.euiRepresentative = euiRepresentative;
	}
	public String getEuiBelongIndustry() {
		return euiBelongIndustry;
	}
	public void setEuiBelongIndustry(String euiBelongIndustry) {
		this.euiBelongIndustry = euiBelongIndustry;
	}
	public String getEuiBelongDistrct() {
		return euiBelongDistrct;
	}
	public void setEuiBelongDistrct(String euiBelongDistrct) {
		this.euiBelongDistrct = euiBelongDistrct;
	}
	public String getEuiConsumeBand() {
		return euiConsumeBand;
	}
	public void setEuiConsumeBand(String euiConsumeBand) {
		this.euiConsumeBand = euiConsumeBand;
	}
	public String getEuiChargeDepartment() {
		return euiChargeDepartment;
	}
	public void setEuiChargeDepartment(String euiChargeDepartment) {
		this.euiChargeDepartment = euiChargeDepartment;
	}
	public String getEuiLocation() {
		return euiLocation;
	}
	public void setEuiLocation(String euiLocation) {
		this.euiLocation = euiLocation;
	}
	public String getEuiContentWay() {
		return euiContentWay;
	}
	public void setEuiContentWay(String euiContentWay) {
		this.euiContentWay = euiContentWay;
	}
	public Double getEuiBuildingArea() {
		return euiBuildingArea;
	}
	public void setEuiBuildingArea(Double euiBuildingArea) {
		this.euiBuildingArea = euiBuildingArea;
	}
	public Integer getEuiHoldPerson() {
		return euiHoldPerson;
	}
	public void setEuiHoldPerson(Integer euiHoldPerson) {
		this.euiHoldPerson = euiHoldPerson;
	}
	public String getEuiBackups() {
		return euiBackups;
	}
	public void setEuiBackups(String euiBackups) {
		this.euiBackups = euiBackups;
	}
	
	
}
