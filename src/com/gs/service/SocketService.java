package com.gs.service;

import java.util.List;

import com.gs.domain.EsmspSumMeasurOrganizationDay;

public interface SocketService {

	String getRealTimeData(String ctdCode, String mmpCodes);

	List<EsmspSumMeasurOrganizationDay> getDayPoint(String ctdCode,
			String mmpCodes);

}
