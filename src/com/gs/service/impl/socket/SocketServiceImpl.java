package com.gs.service.impl.socket;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.gs.domain.PomsConsumeEnergyTerminalRef;
import com.gs.mapper.PomsConsumeEnergyTerminalRefMapper;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cic.socket.SenderFactory;
import com.cic.socket.SendingMessage;
import com.cic.socket.sender.MeterDeviceUpdateSender;
import com.cic.pas.common.bean.MeterDevice;
import com.cic.pas.common.bean.PointDevice;
import com.cic.pas.common.net.ReturnMessage;
import com.gs.domain.EsmspSumMeasurOrganizationDay;
import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsDeviceMeasurPoint;
import com.gs.mapper.EsmspSumMeasurOrganizationDayMapper;
import com.gs.mapper.PomsCalculateTerminalDeviceMapper;
import com.gs.mapper.PomsDeviceMeasurPointMapper;
import com.gs.service.socket.SocketService;

/**
 * @author: gaosong
 * @date:2017-12-3 下午03:45:44
 * @version :1.0.0
 * 
 */
@Service
public class SocketServiceImpl implements SocketService {
	@Autowired
	private PomsCalculateTerminalDeviceMapper ctdMapper;
	@Autowired
	private PomsConsumeEnergyTerminalRefMapper cetrMapper;
	@Autowired
	private PomsDeviceMeasurPointMapper pdmMapper;
	@Autowired
	private EsmspSumMeasurOrganizationDayMapper dayMapper;
	String ip = "10.14.13.198";
	int port = 7005;
	/**
	 * @Title: getRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	public JSONObject getRealData(String ctdCodes) {
		Map<String, String[]> map = getMapByCtds(ctdCodes);
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
		sm.close();
//		List<PointDevice> points = new ArrayList<PointDevice>();
//		for(String key:map.keySet()){
//			PointDevice p=new PointDevice();
//			p.setCtdCode(key);
//			p.setCode(map.get(key)[0]);
//			Calendar c=Calendar.getInstance();
//			p.setValue((double)c.get(Calendar.SECOND));
//			p.setUnits("m");
//			points.add(p);
//		}
		JSONObject json = new JSONObject();
		json.put("points", points);
		return json;
	}

	private Map<String, String[]> getMapByCtds(String ctdCodes) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		String[] ctds = ctdCodes.split(",");
		for (String ctd : ctds) {
			String ctdCode = ctd.substring(0, ctd.indexOf("="));
			String[] points = ctd.substring(ctd.indexOf("=") + 1).split("=");
			if(!map.containsKey(ctdCode)){
			map.put(ctdCode, points);
			}else{
				Object[] objs=ArrayUtils.addAll(map.get(ctdCode), points);
				String[] mmps=new String[objs.length];
				for(int i=0;i<objs.length;i++){
					mmps[i]=objs[i].toString();
				}
				map.put(ctdCode, mmps);
			}
		}
		return map;
	}

	/**
	 * @Title: getCoolRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getCoolRealData() {
		List<PomsCalculateTerminalDevice> list = ctdMapper.findAllByEnergyType(
				"5", "");
		Map<String, String[]> map = new HashMap<String, String[]>();
		for (PomsCalculateTerminalDevice ctd : list) {
			List<PomsDeviceMeasurPoint> pdms = pdmMapper.selectByCalCode(ctd
					.getCtdCodes());
			String[] values = new String[pdms.size()];
			int i = 0;
			for (PomsDeviceMeasurPoint pdm : pdms) {
				values[i] = pdm.getMmpCodes();
				i++;
			}
			map.put(ctd.getCtdCodes(), values);
		}
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
		sm.close();
		Map<String, String[]> results = new HashMap<String, String[]>();
		for (PointDevice p : points) {
			String[] values = new String[7];
			String ctdCode = p.getCtdCode();
			values[0] = p.getCtdName();
			values[1] = p.getTime();
			if (results.containsKey(ctdCode)) {
				values = results.get(ctdCode);
			}
			if (p.getCode().equals("203")) {
				values[2] = p.getValue() + "" + p.getUnits();
			} else if (p.getCode().equals("204")) {
				values[3] = p.getValue() + "" + p.getUnits();
			} else if (p.getCode().equals("205")) {
				values[4] = p.getValue() + "" + p.getUnits();
			} else if (p.getCode().equals("65")) {
				values[5] = p.getValue() + "" + p.getUnits();
			} else if (p.getCode().equals("66")) {
				values[6] = p.getValue() + "" + p.getUnits();
			}
			if (!results.containsKey(ctdCode)) {
				results.put(ctdCode, values);
			}
		}
		List<String[]> strlist = new ArrayList<String[]>();
		for (String key : results.keySet()) {
			strlist.add(results.get(key));
		}
		JSONObject json = new JSONObject();
		json.put("list", strlist);
		return json;
	}

	/**
	 * @Title: getPlcRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getPlcRealData() {
		Map<String, String[]> map = new HashMap<String, String[]>();
		List<PomsDeviceMeasurPoint> pdms = pdmMapper.selectByCalCode("102");
		String[] values = new String[pdms.size()];
		int i = 0;
		for (PomsDeviceMeasurPoint pdm : pdms) {
			values[i] = pdm.getMmpCodes();
			i++;
		}
		map.put("102", values);
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
		sm.close();
		for (PointDevice p : points) {
			if (p.getCode().equals("217")) {
				Double v = dayMapper.daySum(new String[] { "101" },
						new String[] { "31" }, null);
				p.setValue(v);
				break;
			}
		}
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}

	/**
	 * @Title: getPlcRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getAllRealData(String type, String flag) {
		Map<String, String[]> map = new LinkedHashMap<String, String[]>();
		String[] ctds = ctdMapper.findByEnergyType(flag.split(","), type);
		for (String ctd : ctds) {
			List<PomsDeviceMeasurPoint> pdms = pdmMapper.selectByCalCode(ctd);
			String[] values = new String[pdms.size()];
			int i = 0;
			for (PomsDeviceMeasurPoint pdm : pdms) {
				values[i] = pdm.getMmpCodes();
				i++;
			}
			map.put(ctd, values);
		}
		// 请求前置机获取电表信息
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
		sm.close();
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}

	/**
	 * @Title: getPlcRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getPlcReadData(String ctdCode) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put(ctdCode, null);
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
		sm.close();
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}

	/**
	 * @Title: getPlcRealData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getPlcWriteData(String ctdCode, String mmpCode,
			Double value) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put(ctdCode, null);
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceUpdateSender(ctdCode, mmpCode,
				value);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		String result = "写入失败";
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			result = obj.toString();
		}
		sm.close();
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json;
	}
	/**   
	* @Title: getAllRealData   
	* @Description: TODO(这里用一句话描述这个方法的作用)   
	* @param       
	* @return    返回类型   
	* @throws   
	*/   
	@Override
	public JSONObject getAllRealData(String type, String flag,
			String mmpCodeStr) {
		Map<String, String[]> map = new LinkedHashMap<String, String[]>();
		String[] ctds = ctdMapper.findByEnergyType(flag.split(","), type);
		for (String ctd : ctds) {
			map.put(ctd, mmpCodeStr.split(","));
		}
		// 请求前置机获取电表信息
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceMeterDataSender(map);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
//		sm.close();
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}
	public JSONObject getRealDataByCtdCode(String ctdCode){
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceDataByCtdCodeSender(ctdCode);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
//		sm.close();
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}
	public JSONObject getRealDataByTypeAndCode(String type,String oragaCode){
		String ctdCode="1";
		String[] ctds=cetrMapper.selectCtdsByTypeAndCode(type,oragaCode);
		if(ctds!=null&&ctds.length>0){
			ctdCode=ctds[0];
		}
		SenderFactory sf = new SenderFactory(ip, port);
		SendingMessage sm = sf.getMeterDeviceDataByCtdCodeSender(ctdCode);
		List<ReturnMessage> lists = new ArrayList<ReturnMessage>();
		lists = sm.response();
		List<PointDevice> points = new ArrayList<PointDevice>();
		for (ReturnMessage rm : lists) {
			Object obj = rm.getObject();
			JSONArray array = JSONArray.fromObject(obj);
			points = JSONArray.toList(array, PointDevice.class);
		}
//		sm.close();
		JSONObject json = new JSONObject();
		json.put("list", points);
		return json;
	}

}
