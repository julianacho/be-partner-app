package com.experian.bepartner.test;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.experian.AppConfig;
import com.experian.bepartner.enums.EnableEnum;
import com.experian.bepartner.service.IRegisterService;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;
import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class })
public class UserThirdTest {

	@Autowired
	private IRegisterService iRegisterService;

	@Test
	public void registerOk() {

		User user = new User("", "IDENIT", "34578541", "Carlos", "Bill", "steven.ju@gmail.com", "23456448",
				"foto url", EnableEnum.HABILITADO.getValue());
		UserInfo userInfoDATO1 = new UserInfo("", "201001", "102002", EnableEnum.HABILITADO.getValue());
		UserInfo userInfoDATO2 = new UserInfo("", "201002", "103001", EnableEnum.HABILITADO.getValue());

		List<UserInfo> userInfos = new ArrayList<UserInfo>();
		userInfos.add(userInfoDATO1);
		userInfos.add(userInfoDATO2);

		Third third = new Third("", "IDENIT", "286658641", "ASAP X", EnableEnum.HABILITADO.getValue());
		ThirdInfo thirdInfoTHIDS = new ThirdInfo("", "301006", "102002", EnableEnum.HABILITADO.getValue());
		ThirdInfo thirdInfoEGSD = new ThirdInfo("", "301007", "105001", EnableEnum.HABILITADO.getValue());

		List<ThirdInfo> thirdInfos = new ArrayList<ThirdInfo>();
		thirdInfos.add(thirdInfoTHIDS);
		thirdInfos.add(thirdInfoEGSD);

		RegisterModel registerModel = new RegisterModel(user, userInfos, third, thirdInfos);

		ObjectMapper mapper = new ObjectMapper(); 
		System.out.println("JSON: MODELO");
		try {
			System.out.println(mapper.writeValueAsString(registerModel));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Payload register = iRegisterService.register(registerModel);
		assertEquals(register.getStatus(), HttpStatus.ACCEPTED);
	}
}
