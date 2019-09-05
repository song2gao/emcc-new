package com.cic.socket.sender;

import java.util.ArrayList;
import java.util.List;
import com.cic.socket.AbstractConnectSender;
import com.cic.pas.common.bean.MeterDevice;
import com.cic.pas.common.net.Command;
import com.cic.pas.common.net.Message;
import com.gs.domain.PomsCalculateTerminalDevice;

/**
 * 描述:计量终端详细内容信息
 * 
 * @author wangruibo
 * 
 */
public class MeterDeviceDetailSender extends AbstractConnectSender {

	private MeterDevice md;

	public MeterDeviceDetailSender(String ip, int port, MeterDevice md) {
		super(ip, port);
		this.md = md;
	}

	public List<Message> getMessages() {
		List<Message> messages = new ArrayList<Message>();
		Message m = new Message();
		m.setC(Command.MeterStatusDetails);
		m.setMd(md);
		messages.add(m);
		return messages;
	}
}
