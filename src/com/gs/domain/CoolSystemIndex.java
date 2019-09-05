package com.gs.domain;
/**
 * @author: gaosong
 * @date:2017-12-4 下午09:39:46
 * @version :1.0.0
 * 
 */
public class CoolSystemIndex {
	private String ctdName;
	public String getCtdName() {
		return ctdName;
	}
	public void setCtdName(String ctdName) {
		this.ctdName = ctdName;
	}
	private String energyType;
	private Double daySum;
	private Double monthSum;
	private Double yearSum;
	private Double lastDaySum;
	private Double lastMonthSum;
	private Double lastYearSum;
	public String getEnergyType() {
		return energyType;
	}
	public void setEnergyType(String energyType) {
		this.energyType = energyType;
	}
	public Double getDaySum() {
		return daySum;
	}
	public void setDaySum(Double daySum) {
		this.daySum = daySum;
	}
	public Double getMonthSum() {
		return monthSum;
	}
	public void setMonthSum(Double monthSum) {
		this.monthSum = monthSum;
	}
	public Double getYearSum() {
		return yearSum;
	}
	public void setYearSum(Double yearSum) {
		this.yearSum = yearSum;
	}
	public Double getLastDaySum() {
		return lastDaySum;
	}
	public void setLastDaySum(Double lastDaySum) {
		this.lastDaySum = lastDaySum;
	}
	public Double getLastMonthSum() {
		return lastMonthSum;
	}
	public void setLastMonthSum(Double lastMonthSum) {
		this.lastMonthSum = lastMonthSum;
	}
	public Double getLastYearSum() {
		return lastYearSum;
	}
	public void setLastYearSum(Double lastYearSum) {
		this.lastYearSum = lastYearSum;
	}
}
