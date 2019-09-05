package com.gs.domain;

import com.gs.common.util.NumberUtils;

/**
 * @author: gaosong
 * @date:2017-12-6 上午02:09:11
 * @version :1.0.0
 * 
 */
public class DayMonthYear {
	private String ctdName;
	private String roundName;
	private String dateCode;
	private String value;
	private String unit;
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	private String lastValue;
	public String getCtdName() {
		return ctdName;
	}
	public void setCtdName(String ctdName) {
		this.ctdName = ctdName;
	}
	public String getRoundName() {
		return roundName;
	}
	public void setRoundName(String roundName) {
		this.roundName = roundName;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getLastValue() {
		return lastValue;
	}
	public void setLastValue(String lastValue) {
		this.lastValue = lastValue;
	}
	public String getDateCode() {
		return dateCode;
	}
	public void setDateCode(String dateCode) {
		this.dateCode = dateCode;
	}
}
