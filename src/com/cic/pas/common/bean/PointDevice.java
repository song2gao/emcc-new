package com.cic.pas.common.bean;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * @author wz
 * 测量点
 */
public class PointDevice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7321598040130269040L;
	/**主键*/
	private String id; 
	/**测点名称*/
	private String name;
	/**表计编码*/
	private String ctdCode;
	private String ctdName;
	public String getCtdName() {
		return ctdName;
	}
	public void setCtdName(String ctdName) {
		this.ctdName = ctdName;
	}
	/**测点简称*/
	private String symbols;
	/**测点单位*/
	private String units;
	/**测点公式*/
	private String formular;
	/**是否需要存储*/
	private int issave;//1 是 0否
	/**测点类型*/
	private String type;
	/**测点地址*/
	private int plcAddress;
	/**modbus 地址**/
	private String modAddress;
	public String getModAddress() {
		return modAddress;
	}
	public void setModAddress(String modAddress) {
		this.modAddress = modAddress;
	}
	/**测点数据字节数*/
	private int pointLen;
	//是否计算CT
	private int isCt=0;
	//是否计算PT
	private int isPt=0;
	public int getIsCt() {
		return isCt;
	}
	public void setIsCt(int isCt) {
		this.isCt = isCt;
	}
	public int getIsPt() {
		return isPt;
	}
	public void setIsPt(int isPt) {
		this.isPt = isPt;
	}
	public int getPlcAddress() {
		return plcAddress;
	}
	public void setPlcAddress(int plcAddress) {
		this.plcAddress = plcAddress;
	}
	public int getPointLen() {
		return pointLen;
	}
	public void setPointLen(int pointLen) {
		this.pointLen = pointLen;
	}
	private int mmpType;//测点类型  0 只读 1可写
	public int getMmpType() {
		return mmpType;
	}
	public void setMmpType(int mmpType) {
		this.mmpType = mmpType;
	}
	/**存储周期*/
	private String save_interval;
	/**测点存储方式*/
	private String save_style;
	/**测点存储类型*/
	private String statistic_type;
	/**测点上限*/
	private Double up_line;
	/**测点上上限*/
	private Double uper_line;
	/**测点上上限发生时间*/
	private  String uper_time;
	/**测点下限*/
	private Double down_line;
	/**测点下下限*/
	private Double downer_line;
	/**测点下下限发生时间*/
	private  String downer_time;
	/**测点标准值*/
	private Double standard_val =0.0;
	/**测点排序*/  
	private String orders;
	/**测点最大值*/
	private Double max_value;
	/**最大值时间*/
	private String max_time;
	/**测点最小值*/
	private Double min_value;
	/**最小值时间*/
	private String min_time;
	/**测点增量值*/
	private Double increval;
	//测点值
	private Double value=0d;
	private Double dayValue;
	private Double monthValue;
	/**测点编码*/
	private String code;
	public Double getLastPointValue() {
		return lastPointValue;
	}
	public void setLastPointValue(Double lastPointValue) {
		this.lastPointValue = lastPointValue;
	}
	/**计量表计主键*/
	private String meterId;//修改字符类型
	//上一个存储值
	private Double lastPointValue=0d;
	//上一个测点值
	private Double previousValue; 
	/**采数时间*/
	private String time;
	private String dayTime;
	private String monthTime;
	
	/**测点变化时间*/
	private String change_time;
	
	//private java.sql.Timestamp temp_time;
	
	//曲线数据
	private List<Object> curveData;
	//曲线点数
	private int dianshu;
	
	private boolean boor = true;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		if(previousValue == null){
			try {
				previousValue=value;
				setMax_value(value);
				setMin_value(value);
				setIncreval(value);
				if( time!= null){
					setMax_time(time);
					setMin_time(time);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}else{
			try {
				if(Double.doubleToLongBits(value)>Double.doubleToLongBits(previousValue)&&time!=null){
					setMax_value(value);
					setMax_time(time);
				}else if(Double.doubleToLongBits(value)<Double.doubleToLongBits(previousValue)&&time!=null){
					setMin_value(value);
					setMin_time(time);
				}
				setIncreval(value-previousValue);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
//		if(value!=null&&time!=null){
//			try {
//				if(Double.doubleToLongBits(value)>Double.doubleToLongBits(up_line)){
//					setUper_line(value);
//					setUper_time(time);
//				}
//				if(Double.doubleToLongBits(value)<Double.doubleToLongBits(down_line)){
//					setDowner_line(value);
//					setDowner_time(time);
//				}
//				if(Double.doubleToLongBits(value) ==Double.doubleToLongBits( standard_val) && boor == true){
//				setChange_time(time);	
//				boor = false ;						
//				}else if(Double.doubleToLongBits(value) != Double.doubleToLongBits( standard_val) && boor == false ){	
//					setChange_time(time);
//					boor = true ;
//				}	
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//			
//		}	
		this.value=value;
	}
	
	public String getMeterId() {
		return meterId;
	}
	public void setMeterId(String meterId) {
		this.meterId = meterId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Double getPreviousValue() {
		return previousValue;
	}
	public void setPreviousValue(Double previousValue) {
		
		this.previousValue = previousValue;
	}
	public String getSymbols() {
		return symbols;
	}
	public void setSymbols(String symbols) {
		this.symbols = symbols;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public String getFormular() {
		if(formular==null||formular==""){
			formular="/1";
		}
		return formular;
	}
	public void setFormular(String formular) {
		this.formular = formular;
	}
	public int getIssave() {
		return issave;
	}
	public void setIssave(int issave) {
		this.issave = issave;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSave_interval() {
		return save_interval;
	}
	public void setSave_interval(String saveInterval) {
		save_interval = saveInterval;
	}
	public String getSave_style() {
		return save_style;
	}
	public void setSave_style(String saveStyle) {
		save_style = saveStyle;
	}
	public String getStatistic_type() {
		return statistic_type;
	}
	public void setStatistic_type(String statisticType) {
		statistic_type = statisticType;
	}
	
	public Double getUper_line() {
		return uper_line;
	}
	public void setUper_line(Double uperLine) {
		uper_line = uperLine;
	}
	public Double getDowner_line() {
		return downer_line;
	}
	public void setDowner_line(Double downerLine) {
		downer_line = downerLine;
	}
	public Double getStandard_val() {
		return standard_val;
	}
	public void setStandard_val(Double standardVal) {
		standard_val = standardVal;
	}
	public String getOrders() {
		return orders;
	}
	public void setOrders(String orders) {
		this.orders = orders;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Double getMax_value() {
		return max_value;
	}
	public void setMax_value(Double maxValue) {
		max_value = maxValue;
	}
	public String getMax_time() {
		return max_time;
	}
	public void setMax_time(String maxTime) {
		max_time = maxTime;
	}
	public Double getMin_value() {
		return min_value;
	}
	public void setMin_value(Double minValue) {
		min_value = minValue;
	}
	public String getMin_time() {
		return min_time;
	}
	public void setMin_time(String minTime) {
		min_time = minTime;
	}
	public Double getIncreval() {
		return increval;
	}
	public void setIncreval(Double increval) {
		this.increval = increval;
	}
	public String getUper_time() {
		return uper_time;
	}
	public void setUper_time(String uperTime) {
		uper_time = uperTime;
	}
	public String getDowner_time() {
		return downer_time;
	}
	public void setDowner_time(String downerTime) {
		downer_time = downerTime;
	}
	public Double getUp_line() {
		return up_line;
	}
	public void setUp_line(Double upLine) {
		up_line = upLine;
	}
	public Double getDown_line() {
		return down_line;
	}
	public void setDown_line(Double downLine) {
		down_line = downLine;
	}
	public String getChange_time() {
		return change_time;
	}
	public void setChange_time(String changeTime) {
		change_time = changeTime;
		//swap(changeTime);
	}
	/*private void swap (java.sql.Timestamp changeTime){
		if(temp_time != null && temp_time.equals(changeTime)){
			setChange_time(null);
		}
		temp_time = changeTime;
	}*/
	public List<Object> getCurveData() {
		return curveData;
	}
	public void setCurveData(List<Object> curveData) {
		this.curveData = curveData;
		if(this.dianshu == 0) return ;
		if(this.curveData.size() == dianshu){
			synchronized (this) {
				this.notifyAll();
				this.dianshu = 0 ;
			}
		}
	}
	public Double getDayValue() {
		return dayValue;
	}
	public void setDayValue(Double dayValue) {
		this.dayValue = dayValue;
	}
	public Double getMonthValue() {
		return monthValue;
	}
	public void setMonthValue(Double monthValue) {
		this.monthValue = monthValue;
	}
	public String getDayTime() {
		return dayTime;
	}
	public void setDayTime(String dayTime) {
		this.dayTime = dayTime;
	}
	public String getMonthTime() {
		return monthTime;
	}
	public void setMonthTime(String monthTime) {
		this.monthTime = monthTime;
	}
	public int getDianshu() {
		return dianshu;
	}
	public void setDianshu(int dianshu) {
		this.dianshu = dianshu;
	}
	public String getCtdCode() {
		return ctdCode;
	}
	public void setCtdCode(String ctdCode) {
		this.ctdCode = ctdCode;
	}
}
