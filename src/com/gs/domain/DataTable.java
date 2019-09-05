package com.gs.domain;
/**
 * @author: gaosong
 * @date:2017-12-26 下午09:23:35
 * @version :1.0.0
 * 
 */
public class DataTable {
	
	private String ctdCode;
	
	private String ctdName;
	
	private int type;
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	private String beginDate;
	
	private Double beginValue;
	
	private String endDate;
	
	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	private Double endValue;
	
	private Double value;
	
	private String unit;

	public String getCtdCode() {
		return ctdCode;
	}

	public void setCtdCode(String ctdCode) {
		this.ctdCode = ctdCode;
	}

	public String getCtdName() {
		return ctdName;
	}

	public void setCtdName(String ctdName) {
		this.ctdName = ctdName;
	}

	public Double getBeginValue() {
		return beginValue;
	}

	public void setBeginValue(Double beginValue) {
		this.beginValue = beginValue;
	}

	public Double getEndValue() {
		return endValue;
	}

	public void setEndValue(Double endValue) {
		this.endValue = endValue;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

}
