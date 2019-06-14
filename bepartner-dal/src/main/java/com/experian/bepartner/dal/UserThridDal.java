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
import com.experian.bepartner.payload.UserInfo;
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
	public UserThird mpUserThridCreate(UserThird userThird) {

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_User_Public", userThird.getvIdUserPublic());
		parameters.put("V_Id_Third_Public", userThird.getvIdThirdPublic());
		parameters.put("V_Enable", userThird.getvEnable());

		List<Map> listMap =  (List<Map>) iProcessService.callProcedure(dataSource, "SP_UpSert_User_third", parameters, Object.class);
 
		UserThird userThirdResponse=new UserThird();
		userThirdResponse.setIdUserThird(Integer.valueOf((String)listMap.get(0).get("Id_User_Third")));
		logger.debug("UserThridDal.mpUserThridCreate {}", userThirdResponse);

		return userThirdResponse;
	}
	
 
}
