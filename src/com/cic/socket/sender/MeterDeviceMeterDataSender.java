package com.cic.socket.sender;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cic.socket.AbstractConnectSender;
import com.cic.pas.common.net.Command;
import com.cic.pas.common.net.Message;
/**
 * 描述:请求计量表的数据
 * @author wangruibo
 *
 */
public class MeterDeviceMeterDataSender extends AbstractConnectSender{
	private Map<String, String[]> map;
	
	public MeterDeviceMeterDataSender(String ip,int port,Map<String, String[]> map){
		super(ip,port);
		this.map=map;
	}
	
	public  List<Message> getMessages(){
		List<Message> messages = new ArrayList<Message>();
			Message m = new Message();
			m.setC(Command.MeterData);
			m.setMap(map);
			messages.add(m);		
		return messages;
	}
}
