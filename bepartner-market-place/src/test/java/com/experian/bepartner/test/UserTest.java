package com.experian.bepartner.test;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.experian.AppConfig;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;
import com.experian.bepartner.payload.ThirdModel;
import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;
import com.experian.bepartner.payload.UserModel;
import com.experian.bepartner.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class })
public class UserTest {
	private static final Logger logger = LoggerFactory.getLogger(UserTest.class);

	@Autowired
	private IUserService iUserService;

	@Test
	public void createUserModel() {

		Payload payloadThirdExist = iUserService.findByIdentify("IDENIT", "8995154024");
		if (payloadThirdExist.getStatus().equals(HttpStatus.NO_CONTENT)) {

			User user = new User("", "IDENIT", "8995154024", "Andres Camilo","Pacheco", "andres.hu@gmail.com", "300827648",
					"foto url", 1);
			UserInfo userInfoDATO1 = new UserInfo("", "DATO1", "Calle 33", 1);
			UserInfo userInfoDATO2 = new UserInfo("", "DATO2", "Informe 22", 1);

			List<UserInfo> userInfos = new ArrayList<UserInfo>();
			userInfos.add(userInfoDATO1);
			userInfos.add(userInfoDATO2);
			UserModel userModel = new UserModel(user, userInfos);

			Payload thirdInfoCreate = iUserService.userModelCreate(userModel);
			assertEquals(thirdInfoCreate.getStatus(), HttpStatus.ACCEPTED);
		}
	}

	@Test
	public void createUserAndThirdInfo() {
		Payload payloadUserExist = iUserService.findByIdentify("IDENIT", "735654024");
		if (payloadUserExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
			User user = new User("", "IDENIT", "735654024", "Steven Camilo","Pacheco", "steven.ju@gmail.com", "317345648",
					"foto url", 1);

			Payload payloadUserResult = iUserService.userCreate(user);
			if (payloadUserResult.getStatus().equals(HttpStatus.ACCEPTED)) {
				User userResult = (User) payloadUserResult.getContent();

				UserInfo userInfoDATO1 = new UserInfo(userResult.getvIdUserPublic(), "DATO1", "Calle 45", 1);
				UserInfo userInfoDATO2 = new UserInfo(userResult.getvIdUserPublic(), "DATO2", "Informe 26", 1);

				List<UserInfo> userInfos = new ArrayList<UserInfo>();
				userInfos.add(userInfoDATO1);
				userInfos.add(userInfoDATO2);

				Payload userInfoResponse = iUserService.userInfoCreate(userInfos);
				assertEquals(userInfoResponse.getStatus(), HttpStatus.ACCEPTED);
			}
		}
	}

}
