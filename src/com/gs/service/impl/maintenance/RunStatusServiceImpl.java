package com.gs.service.impl.maintenance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.common.util.Configer;
import com.gs.domain.PomsFrontProcessorConfig;
import com.gs.mapper.PomsFrontProcessorConfigMapper;
import com.gs.service.maintenance.RunStatusService;
import com.cic.socket.SenderFactory;
import net.sf.json.JSONObject;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-19 上午09:03:07 
 * 描述： RunStatusService  实现类
 */
@Service
@Transactional
public class RunStatusServiceImpl implements RunStatusService {

	@Resource
	public PomsFrontProcessorConfigMapper frontProcessorMapper;
	
	/**
	 * 通过 ID 查询所有  返回  josn格式
	 */
	@Override
	public JSONObject findFrontendById(String id) {
		// TODO Auto-generated method stub
		PomsFrontProcessorConfig ppp = frontProcessorMapper.selectByPrimaryKey(id);
		JSONObject json = new JSONObject();
		if (ppp!=null) {
			ppp.setCommunicateProtocal(ppp.getCommunicateProtocal());
			ppp.setFrontProcessorIp(ppp.getFrontProcessorIp());
			ppp.setFrontProcessorPort(ppp.getFrontProcessorPort());
			ppp.setId(ppp.getId());
//			ppp.setPomsCommunicationRoutingConfigs(new HashSet(0));
		}
		//取前置机数
		String ip = Configer.getInstance().get("collectingDeviceIP").toString();
		int port = Integer.parseInt((String) Configer.getInstance().get("collectingDevicePort"));
		json.put("keys", ppp);
		return json;
	}
	/**
	 * 取前置机数  返回  josn格式
	 */
	@Override
	public JSONObject getFrontend(String names, String ports,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<PomsFrontProcessorConfig> list = new ArrayList<PomsFrontProcessorConfig>();
		int size;
		if (names == "" && ports == "") {
			list = frontProcessorMapper.getFrontendAll(pageSize*(pageIndex-1), pageSize);
			size = frontProcessorMapper.getFrontendAllCount();
		}else {
			list = frontProcessorMapper.getFrontendMo(names, ports, pageSize*(pageIndex-1), pageSize);
			size = frontProcessorMapper.getFrontendMoCount(names, ports);
		}
		JSONObject json = new JSONObject();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				PomsFrontProcessorConfig p = list.get(i);
				p.setCommunicateProtocal(p.getCommunicateProtocal());
				p.setFrontProcessorIp(p.getFrontProcessorIp());
				p.setFrontProcessorPort(p.getFrontProcessorPort());
				p.setId(p.getId());
//				p.setPomsCommunicationRoutingConfigs(new HashSet(0));
			}
		}
		
//		取前置机数
		String ip = Configer.getInstance().get("collectingDeviceIP").toString();
		int port = Integer.parseInt((String) Configer.getInstance().get("collectingDevicePort"));
		SenderFactory sf = new SenderFactory(ip,port);
		json.put("size", size);
		json.put("list", list);
		return json;
	}
	
	
}
