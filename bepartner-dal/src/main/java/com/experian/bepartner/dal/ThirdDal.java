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

@Service
public class ThirdDal implements IThirdDal {

	private static final Logger logger = LoggerFactory.getLogger(ThirdDal.class);

	@Autowired
	private IProcessService iProcessService;

	@Autowired
	@Qualifier("bepartnersDataSource")
	private DataSource dataSource;

	@Override
	public Object mpThirdCreate(Third third) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("V_Id_Type", third.getVIdType());
		parameters.put("V_Identification_Number", third.getVIdentificationNumber());
		parameters.put("V_Profile_Info", third.getVProfileInfo());
		Object object = iProcessService.callProcedure(dataSource, "MP_Create_Third", parameters, Object.class);

		logger.debug("ThirdDal.mpThirdCreate {}", object);
		return object;
	}

	@Override
	public List<Object> mpThirdInfoCreate(List<ThirdInfo> thirdInfos) {
		List<Object> response = new ArrayList<Object>();
		for (ThirdInfo thirdInfo : thirdInfos) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("V_Id_Type", thirdInfo.getVIdType());
			parameters.put("V_Identification_Number", thirdInfo.getVIdentificationNumber());
			parameters.put("V_Id_Info_Type_Third", thirdInfo.getVIdInfoTypeThird());
			parameters.put("V_Value", thirdInfo.getValue());
			Object object = iProcessService.callProcedure(dataSource, "MP_Create_Third_Info", parameters, Object.class);
			response.add(object);
			logger.debug("ThirdDal.mpThirdInfoCreate {}", object);
		}

		return response;
	}

}
