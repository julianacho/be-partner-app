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
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.experian.bepartners.payload.UserThird;
import com.experian.process.IProcessService;

@Service
@Transactional
public class UserDal implements IUserDal {

	private static final Logger logger = LoggerFactory.getLogger(UserDal.class);

	@Autowired
	private IProcessService iProcessService;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Override
	public User mpUserCreate(User user) throws Exception{

	
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_User_Public", user.getvIdUserPublic());
		parameters.put("V_Id_Type", user.getvIdType());
		parameters.put("V_Identification_Number", user.getvIdentificationNumber());
		parameters.put("V_Name", user.getvName());
		parameters.put("V_Last_Name", user.getvLastName());
		parameters.put("V_Email", user.getvEmail());
		parameters.put("V_Phone", user.getvPhone());
		parameters.put("V_Profile_Picture", user.getvProfilePicture());
		parameters.put("V_Enable", user.getvEnable());

				
		List<Map> listMap =  (List<Map>) iProcessService.callProcedure(dataSource, "SP_UpSert_User", parameters, Object.class);
		User result=new User(
				(String)listMap.get(0).get("Id_User_Public"), 
				(String)listMap.get(0).get("Id_Type"),  
				(String)listMap.get(0).get("Identification_Number"),  
				(String)listMap.get(0).get("Name"),  
				(String)listMap.get(0).get("Last_Name"),  
				(String)listMap.get(0).get("Email"), 
				(String)listMap.get(0).get("Phone"), 
				(String)listMap.get(0).get("Profile_Picture"),  
				(Boolean)listMap.get(0).get("Enable") ? 1 : 0);
		
		
		logger.debug("UserDal.mpUserCreate {}", result);
		return result;
	}

	@Override
	public List<UserInfo> mpUserInfoCreate(List<UserInfo> userInfoList) throws Exception{
		List<UserInfo> response = new ArrayList<UserInfo>();
		for (UserInfo usuarioInfo : userInfoList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_User_Public", usuarioInfo.getvIdUserPublic());
			parameters.put("V_Id_Info_Type_User", usuarioInfo.getvIdInfoTypeUser());
			parameters.put("V_Value", usuarioInfo.getvValue());
			parameters.put("V_Enable", usuarioInfo.getvEnable());

			List<Map> listMap =  (List<Map>) iProcessService.callProcedure(dataSource, "SP_UpSert_User_Info", parameters,
					Object.class);
			UserInfo result=new UserInfo(
					"", 
					(String)listMap.get(0).get("Id_Info_Type_User"), 
					(String)listMap.get(0).get("Value"), 
					(Boolean)listMap.get(0).get("Enable") ? 1 : 0);
			
			response.add(result);
			logger.debug("UserDal.mpUserInfoCreate {}", result);
		}
		return response;
	}

}
