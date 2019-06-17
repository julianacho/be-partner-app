package com.experian.bepartnerslog.dal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartner.dal.UserDal;
import com.experian.bepartners.payload.UserLog;
import com.experian.bepartners.payload.UserLogInfo;
import com.experian.process.IProcessService;

@Service
@Transactional
public class LogRegisterDal implements ILogRegisterDal {

	private static final Logger logger = LoggerFactory.getLogger(LogRegisterDal.class);

	@Autowired
	@Qualifier("bepartnerslogDataSource")
	private DataSource dataSource;

	@Autowired
	private IProcessService iProcessService;

	@Override
	public UserLog mpUserLogCreate(UserLog userLog) throws Exception {
		logger.debug("LogRegisterDal.mpUserLogCreate {}", userLog);
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("v_Id_Third_Public", userLog.getvIdThirdPublic());
		parameters.put("v_Id_User_Public", userLog.getvIdUserPublic());
		parameters.put("V_Id_Razon", userLog.getVIdRazon());
		parameters.put("V_Id_Estatus", userLog.getVIdEstatus());

		List<Map> listMap = (List<Map>) iProcessService.callProcedure(dataSource, "SP_Insert_User_Log", parameters,
				Object.class);
		userLog.setIdLogTransactionUser((Integer) listMap.get(0).get("Id_Log_transaction_User"));

		return userLog;
	}

	@Override
	public UserLogInfo mpUserLogInfoCreate(UserLogInfo userLogInfo) throws Exception {

		logger.debug("LogRegisterDal.mpUserLogInfoCreate {}", userLogInfo);

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_Log_Transaction_User", userLogInfo.getvIdLogTransactionUser());
		parameters.put("V_Value", userLogInfo.getvValue());
		parameters.put("V_Transaction_Type", userLogInfo.getvTransactionType());

		List<Map> listMap = (List<Map>) iProcessService.callProcedure(dataSource, "SP_Insert_User_Log_Info", parameters,
				Object.class);

		return userLogInfo;
	}

}
