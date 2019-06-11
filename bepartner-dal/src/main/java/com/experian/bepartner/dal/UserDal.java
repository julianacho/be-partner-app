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

import com.experian.bepartner.payload.Usuario;
import com.experian.bepartner.payload.UsuarioInfo;
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
	public Object mpUserCreate(Usuario usuario) {

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_Type", usuario.getvIdType());
		parameters.put("V_Identification_Number", usuario.getvIdentificationNumber());
		parameters.put("V_Name", usuario.getvName());
		parameters.put("V_Last_Name", usuario.getvLastName());
		parameters.put("V_Email", usuario.getvEmail());
		parameters.put("V_Phone", usuario.getvPhone());
		parameters.put("V_Profile_Picture", usuario.getvProfilePicture());

		Object object = iProcessService.callProcedure(dataSource, "MP_Create_User", parameters, Object.class);

		logger.debug("UserDal.mpUserCreate {}", object);
		return object;
	}

	@Override
	public List<Object> mpUserInfoCreate(List<UsuarioInfo> usuarioInfoList) {
		List<Object> response = new ArrayList<Object>();
		for (UsuarioInfo usuarioInfo : usuarioInfoList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_Type", usuarioInfo.getvIdType());
			parameters.put("V_Identification_Number", usuarioInfo.getvIdentificationNumber());
			parameters.put("V_Id_Info_Type_User", usuarioInfo.getvIdInfoTypeUser());
			parameters.put("V_Value", usuarioInfo.getvValue());

			Object object = iProcessService.callProcedure(dataSource, "MP_Create_User_Info", parameters, Object.class);
			response.add(object);
			logger.debug("UserDal.mpUserInfoCreate {}", object);
		}
		return response;
	}

}
