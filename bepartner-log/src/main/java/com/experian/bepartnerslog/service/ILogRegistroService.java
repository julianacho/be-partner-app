package com.experian.bepartnerslog.service;

import java.util.List;

import com.experian.bepartners.payload.LogModel;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.UserLog;
import com.experian.bepartners.payload.UserLogInfo;

public interface ILogRegistroService {
	public Payload mpUserLogCreate(UserLog userLog);

	public Payload mpUserLogInfoCreate(UserLogInfo userLogInfo);

	public Payload mpUserLogModelCreate(LogModel logModel);

	public void logInfoRegister(String vIdThirdPublic, String vIdUserPublic, String VIdRazon, String VIdEstatus,
			List<UserLogInfo> infos);
}
