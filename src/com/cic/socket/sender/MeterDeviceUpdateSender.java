package com.cic.socket.sender;

import java.util.ArrayList;
import java.util.List;

import com.cic.socket.AbstractConnectSender;
import com.cic.pas.common.net.Command;
import com.cic.pas.common.net.Message;
import com.gs.domain.PomsCalculateTerminalDevice;

/**
 * 描述：计量表更新命令
 * 
 * @author wangruibo
 * 
 */
public class MeterDeviceUpdateSender extends AbstractConnectSender {

	private List<PomsCalculateTerminalDevice> calculates;

	private String ctdCode;

	private String mmpCode;

	private Double value;

	public MeterDeviceUpdateSender(String ip, int port,
			List<PomsCalculateTerminalDevice> list) {
		super(ip, port);
		this.calculates = list;
	}

	public MeterDeviceUpdateSender(String ip, int port, String ctdCode,
			String mmpCode, Double value) {
		super(ip, port);
		this.ctdCode = ctdCode;
		this.mmpCode = mmpCode;
		this.value = value;
	}

//	public List<Message> getMessages() {
//		List<Message> messages = new ArrayList<Message>();
//		for (PomsCalculateTerminalDevice cal : calculates) {
//			Message m = new Message();
//			m.setC(Command.Update);
//			m.setCollect(Integer.parseInt(cal.getCdtAssembleid()));
//			m.setMeterId(cal.getId());
//			messages.add(m);
//		}
//		return messages;
//	}

	public List<Message> getMessages() {
		List<Message> messages = new ArrayList<Message>();
		Message m = new Message();
		m.setC(Command.Update);
		m.setMeterCode(ctdCode);
		m.setPointCode(mmpCode);
		m.setValue(value);
		messages.add(m);
		return messages;
	}
	public void close(){
		super.close();
	}
}
