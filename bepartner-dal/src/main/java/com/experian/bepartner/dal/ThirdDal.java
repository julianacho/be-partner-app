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

import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;
import com.experian.process.IProcessService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ThirdDal implements IThirdDal {

	private static final Logger logger = LoggerFactory.getLogger(ThirdDal.class);

	@Autowired
	private IProcessService iProcessService;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Override
	public Third mpThirdCreate(Third third) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("v_Id_Third_Public", third.getV_Id_Third_Public());
		parameters.put("V_Id_Type", third.getV_Id_Type());
		parameters.put("V_Identification_Number", third.getV_Identification_Number());
		parameters.put("V_Business_Name", third.getV_Business_Name());
		parameters.put("V_Enable", third.getV_Enable());
		List<Map> listMap =  (List<Map>) iProcessService.callProcedureResultToJson(dataSource, "SP_UpSert_Third", parameters,
				Third.class);
		
		Third result = new Third((String)listMap.get(0).get("Id_Third_Public"), 
				(String)listMap.get(0).get("Id_Type"), 
				(String)listMap.get(0).get("Identification_Number"), 
				(String)listMap.get(0).get("Business_Name"), 
				(Boolean)listMap.get(0).get("Enable") ? 1 : 0);
	 
		 

		logger.debug("ThirdDal.mpThirdCreate {}", result);
		return result;
	}

	@Override
	public List<ThirdInfo> mpThirdInfoCreate(List<ThirdInfo> thirdInfos) {
		List<ThirdInfo> response = new ArrayList<ThirdInfo>();
		for (ThirdInfo thirdInfo : thirdInfos) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_Third_Public", thirdInfo.getV_Id_Third_Public());
			parameters.put("V_Id_Info_Type_Third", thirdInfo.getV_Id_Info_Type_Third());
			parameters.put("V_Value", thirdInfo.getV_Value());
			parameters.put("V_Enable", thirdInfo.getV_Enable());

			List<Map> listMap =  (List<Map>) iProcessService.callProcedureResultToJson(dataSource,
					"SP_UpSert_Third_Basic_Info", parameters, ThirdInfo.class);
			
			ThirdInfo result = new ThirdInfo(
					"", 
					(String)listMap.get(0).get("Id_Info_Type_Third"), 
					(String)listMap.get(0).get("Value"), 
					(Boolean)listMap.get(0).get("Enable") ? 1 : 0);
			
			response.add(result);
			logger.debug("ThirdDal.mpThirdInfoCreate {}", result);
		}

		return response;
	}

}
