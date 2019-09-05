package com.cic.socket.sender;

import java.util.ArrayList;
import java.util.List;

import com.cic.pas.common.net.Command;
import com.cic.pas.common.net.Message;
import com.cic.socket.AbstractConnectSender;
import com.gs.domain.EsmspSumMeasurOrganizationDay;

/**
 * 描述:计量终端详细内容信息
 * 
 * @author wangruibo
 * 
 */
public class MeterCurvedSender extends AbstractConnectSender {

	private String ctdCodes;

	private String mmpCodes;

	public MeterCurvedSender(String ip, int port, String ctdCodes,
			String mmpCodes) {
		super(ip, port);
		this.ctdCodes = ctdCodes;
		this.mmpCodes = mmpCodes;
	}

	public List<Message> getMessages() {
		List<Message> messages = new ArrayList<Message>();
		Message m = new Message();
		m.setC(Command.MeterDataCurved);
		m.setMeterCode(ctdCodes);
		m.setPointCode(mmpCodes);
		messages.add(m);		
		return messages;
	}
}
