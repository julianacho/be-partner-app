package com.experian.bepartnerslog.dal;

import com.experian.bepartners.payload.UserLog;
import com.experian.bepartners.payload.UserLogInfo;

public interface ILogRegisterDal {

	public UserLog mpUserLogCreate(UserLog userLog) throws Exception;

	public UserLogInfo mpUserLogInfoCreate(UserLogInfo userLogInfo) throws Exception;
}
