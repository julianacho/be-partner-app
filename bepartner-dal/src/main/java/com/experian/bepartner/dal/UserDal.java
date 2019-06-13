package com.experian.bepartner.dal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;
import com.experian.process.IProcessService;

@Service
public class UserDal implements IUserDal {

	private static final Logger logger = LoggerFactory.getLogger(UserDal.class);

	@Autowired
	private IProcessService iProcessService;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Override
	public Object mpUserCreate(User usuario) {

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_User_Public", usuario.getvIdType());
		parameters.put("V_Id_Type", usuario.getvIdType());
		parameters.put("V_Identification_Number", usuario.getvIdType());
		parameters.put("V_Name", usuario.getvIdType());
		parameters.put("V_Last_Name", usuario.getvIdType());
		parameters.put("V_Email", usuario.getvIdType());
		parameters.put("V_Phone", usuario.getvIdType());
		parameters.put("V_Profile_Picture", usuario.getvIdType());
		parameters.put("V_Enable", usuario.getvIdType());

		Object object = iProcessService.callProcedure(dataSource, "SP_UpSert_User", parameters, Object.class);

		logger.debug("UserDal.mpUserCreate {}", object);
		return object;
	}

	@Override
	public List<Object> mpUserInfoCreate(List<UserInfo> usuarioInfoList) {
		List<Object> response = new ArrayList<Object>();
		for (UserInfo usuarioInfo : usuarioInfoList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_User_Public", usuarioInfo.getvIdUserPublic());
			parameters.put("V_Id_Info_Type_User", usuarioInfo.getvIdInfoTypeUser());
			parameters.put("V_Value", usuarioInfo.getvValue());
			parameters.put("V_Enable", usuarioInfo.getvEnable());

			Object object = iProcessService.callProcedure(dataSource, "SP_UpSert_User_Info", parameters,
					Object.class);
			response.add(object);
			logger.debug("UserDal.mpUserInfoCreate {}", object);
		}
		return response;
	}

}
