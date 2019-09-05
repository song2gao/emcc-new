package com.gs.domain;

/**
 * @author: gaosong
 * @date:2017-12-5 下午03:23:53
 * @version :1.0.0
 * 
 */
public class HistoryTableData {
	private String ctdName;

	private String mmpName;

	public String getMmpName() {
		return mmpName;
	}

	public void setMmpName(String mmpName) {
		this.mmpName = mmpName;
	}

	private String dateCode;

	private String timeCode;

	public double calValue;

	private double sumValue;

	private String unit;

	public String getCtdName() {
		return ctdName;
	}

	public void setCtdName(String ctdName) {
		this.ctdName = ctdName;
	}

	public String getDateCode() {
		return dateCode;
	}

	public void setDateCode(String dateCode) {
		this.dateCode = dateCode;
	}

	public String getTimeCode() {
		return timeCode;
	}

	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}

	public double getCalValue() {
		return calValue;
	}

	public void setCalValue(double calValue) {
		this.calValue = calValue;
	}

	public double getSumValue() {
		return sumValue;
	}

	public void setSumValue(double sumValue) {
		this.sumValue = sumValue;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof HistoryTableData) {
			HistoryTableData u = (HistoryTableData) obj;
			if (this.mmpName.equals(u.mmpName

			)) {
				return true;
			}
		}
		return false;
	}
	public String toString() {
		return this.mmpName+ "\t" + this.mmpName + "\t" + this.mmpName;
	}

}
