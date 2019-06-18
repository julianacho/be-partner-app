package com.experian.servicebroker;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.junit4.SpringRunner;

import com.experian.bepartner.enums.EnableEnum;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.RuesRequest;
import com.experian.bepartners.payload.Third;
import com.experian.bepartners.payload.ThirdInfo;
import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.experian.servicebroker.service.IRegisterService;
import com.experian.servicebroker.service.IRuesService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BepartnerServiceBrokerApplicationTests {

	@Autowired
	private IRegisterService iRegisterService;

	@Autowired
	private IRuesService iRuesService;

	@Test
	public void requestRues() {
		RuesRequest rues = new RuesRequest("900422614aa");
		Payload response = iRuesService.requestRues(rues);
		System.out.println(response.getContent());
		System.out.println();
		assertEquals(response.getStatus(), HttpStatus.ACCEPTED);
	}

	@Test
	public void requestRegister() {
//		User user = new User("", "IDENIT", "01001230141", "Sebastian", "Martinex", "sbx2.ju@gmail.com", "23456448",
//				"foto url", EnableEnum.HABILITADO.getValue());
//		UserInfo userInfoDATO1 = new UserInfo("", "201001", "102002", EnableEnum.HABILITADO.getValue());
//		UserInfo userInfoDATO2 = new UserInfo("", "201002", "103001", EnableEnum.HABILITADO.getValue());
//
//		List<UserInfo> userInfos = new ArrayList<UserInfo>();
//		userInfos.add(userInfoDATO1);
//		userInfos.add(userInfoDATO2);
//
//		Third third = new Third("", "IDENIT", "221101101121", "Experian X 10", EnableEnum.HABILITADO.getValue());
//		ThirdInfo thirdInfoTHIDS = new ThirdInfo("", "301006", "102002", EnableEnum.HABILITADO.getValue());
//		ThirdInfo thirdInfoEGSD = new ThirdInfo("", "301007", "105001", EnableEnum.HABILITADO.getValue());
//
//		List<ThirdInfo> thirdInfos = new ArrayList<ThirdInfo>();
//		thirdInfos.add(thirdInfoTHIDS);
//		thirdInfos.add(thirdInfoEGSD);
//
//		RegisterModel registerModel = new RegisterModel(user, userInfos, third, thirdInfos);
//
//		Payload response = iRegisterService.register(registerModel);
//		assertEquals(response.getStatus(), HttpStatus.ACCEPTED);
	}

}
