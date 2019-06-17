package com.experian.bepartnerslog.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartners.payload.LogModel;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.UserLog;
import com.experian.bepartners.payload.UserLogInfo;
import com.experian.bepartners.payload.UserModel;
import com.experian.bepartnerslog.dal.ILogRegisterDal;
import com.experian.bepartnerslog.dal.LogRegisterDal;

@Service
@Transactional
public class LogRegistroService implements ILogRegistroService {

	private static final Logger logger = LoggerFactory.getLogger(LogRegistroService.class);

	@Autowired
	private ILogRegisterDal iLogRegisterDal;

	@Override
	public Payload mpUserLogCreate(UserLog userLog) {
		try {
			logger.debug("LogRegistroService.mpUserLogCreate {}", userLog);

			UserLog uLog = iLogRegisterDal.mpUserLogCreate(userLog);
			if (uLog != null && uLog.getIdLogTransactionUser() != null) {
				return new Payload(HttpStatus.ACCEPTED, uLog);
			}
			return new Payload(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload mpUserLogInfoCreate(UserLogInfo userLogInfo) {
		try {
			logger.debug("LogRegistroService.mpUserLogInfoCreate {}", userLogInfo);

			UserLogInfo uLog = iLogRegisterDal.mpUserLogInfoCreate(userLogInfo);

			return new Payload(HttpStatus.ACCEPTED);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload mpUserLogModelCreate(LogModel logModel) {
		try {
			Payload userLogPayload = mpUserLogCreate(logModel.getUserLog());
			if (userLogPayload.getStatus().equals(HttpStatus.ACCEPTED)) {
				UserLog userLogResponse = (UserLog) userLogPayload.getContent();
				for (UserLogInfo userLogInfo : logModel.getUserLogInfos()) {
					userLogInfo.setvIdLogTransactionUser(userLogResponse.getIdLogTransactionUser());
					mpUserLogInfoCreate(userLogInfo);
				}
				return new Payload(HttpStatus.ACCEPTED);
			} else {
				return new Payload(HttpStatus.CONFLICT, userLogPayload.getContent());
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public void logInfoRegister(String vIdThirdPublic, String vIdUserPublic, String VIdRazon, String VIdEstatus,
			List<UserLogInfo> infos) {
		UserLog userLog=new UserLog(vIdThirdPublic, vIdUserPublic, VIdRazon, VIdEstatus);
		Payload response=mpUserLogModelCreate(new LogModel(userLog, infos));
		
	}

}
