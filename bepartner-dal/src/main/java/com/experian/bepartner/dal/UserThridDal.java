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

import com.experian.bepartner.payload.UserThird;
import com.experian.bepartner.payload.UserThirdInfo;
import com.experian.bepartner.payload.UsuarioInfo;
import com.experian.process.IProcessService;

@Service
public class UserThridDal implements IUserThridDal {

	private static final Logger logger = LoggerFactory.getLogger(UserThridDal.class);

	@Autowired
	private IProcessService iProcessService;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Override
	public Object mpUserThridCreate(UserThird userThird) {

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_Type_User", userThird.getvIdTypeUser());
		parameters.put("V_Identification_Number_User", userThird.getvIdentificationNumberUser());
		parameters.put("V_Id_Type_Third", userThird.getvIdTypeThird());
		parameters.put("V_Identification_Number_Third", userThird.getvIdentificationNumberThird());

		Object object = iProcessService.callProcedure(dataSource, "MP_Create_User_Third", parameters, Object.class);

		logger.debug("UserThridDal.mpUserThridCreate {}", object);

		return object;
	}

	@Override
	public List<Object> mpUserThridInfoCreate(List<UserThirdInfo> userThirdInfos) {

		List<Object> response=new ArrayList<Object>();
		for (UserThirdInfo userThirdInfo : userThirdInfos) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_Type", userThirdInfo.getvIdType());
			parameters.put("V_Identification_Number", userThirdInfo.getvIdentificationNumber());
			parameters.put("V_Id_Info_Type_User", userThirdInfo.getvIdInfoTypeUser());
			parameters.put("V_Value", userThirdInfo.getvValue());

			Object object = iProcessService.callProcedure(dataSource, "MP_Create_User_Info", parameters, Object.class);
			response.add(object);
			logger.debug("UserThridDal.mpUserThridInfoCreate {}", object);

		}
		return response;
	}

}
