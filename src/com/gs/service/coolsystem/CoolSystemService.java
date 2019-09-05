package com.gs.service.coolsystem;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gs.domain.CoolSystemIndex;
import com.gs.domain.DataTable;
import com.gs.domain.DayMonthYear;
import com.gs.domain.HistoryTableData;
import com.gs.domain.PomsCalculateTerminalDevice;

/**
 * @author: gaosong
 * @date:2017-12-4 下午09:27:38
 * @version :1.0.0
 * 
 */
public interface CoolSystemService {
	Double daySum(String[] ctds,String dateCode,String[] mmpCode);
	Double monthSum(String[] ctds,String dateCode,String[] mmpCode);
	Double yearSum(String[] ctds,String dateCode,String[] mmpCode);
	String[] getCtdsByType(String energyType,String flag);
	List<CoolSystemIndex> getCoolSystemIndex(String[] energyTypes,String flag);
	JSONArray getTree(String id,String energyType, String flag);
	List<HistoryTableData> getHistoryData(String type,String flag,String dateCode,String timeCode) throws ParseException, NoSuchMethodException, SecurityException, NumberFormatException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	List<DayMonthYear> getDayMonthYear(String energyType,String[] mmpCode,String ctdCode,String flag,String dateCode);
	List<DataTable> getDataTable(String energyType,String mmpCode,String begindate,String begintime,String enddate,String endtime,String type) throws NumberFormatException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ParseException, NoSuchMethodException, SecurityException;
	List<HistoryTableData> getNewTableData(String type,
			String dateCode, String timeCode) throws ParseException,
			NoSuchMethodException, SecurityException, NumberFormatException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException;
	List<HistoryTableData> getPointData(String flag, String date) throws ParseException, NoSuchMethodException, SecurityException, NumberFormatException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	Double lyearSum(String ctds, String[] mmpCode);
	JSONObject getModelPointByCtmId(String ctmId);
	JSONObject getHistoryCustomMade(String systemCode, String dateCode);
	JSONObject getAllCtds();
}
