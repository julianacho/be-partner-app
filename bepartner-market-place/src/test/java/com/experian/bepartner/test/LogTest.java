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
import com.experian.bepartners.payload.LogModel;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.UserLog;
import com.experian.bepartners.payload.UserLogInfo;
import com.experian.bepartnerslog.enums.AddInfoLogEnum;
import com.experian.bepartnerslog.enums.ReasonLogsEnum;
import com.experian.bepartnerslog.enums.StatusLogEnum;
import com.experian.bepartnerslog.service.ILogRegistroService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class })
public class LogTest {

	private static final Logger logger = LoggerFactory.getLogger(LogTest.class);

	@Autowired
	private ILogRegistroService iLogRegistroService;

	@Test
	public void testLogModel() {
		UserLog userLog=new UserLog("fd9c5c5c-8ed8-11e9-ad04-e0db559470aa", "fdcbbb31-8ed8-11e9-ad04-e0db559470aa", ReasonLogsEnum.REGISTRO.getValue(), StatusLogEnum.ERROR.getValue());
		UserLogInfo userLogInfoA=new UserLogInfo("{JSON A}", AddInfoLogEnum.ERROR_JSON.getValue());
		UserLogInfo userLogInfoB=new UserLogInfo("{JSON B}", AddInfoLogEnum.IDENTIFICACION_USUARIO.getValue());
		
		List<UserLogInfo> userLogInfos=new ArrayList<UserLogInfo>();
		userLogInfos.add(userLogInfoA);
		userLogInfos.add(userLogInfoB);
		
		Payload response=iLogRegistroService.mpUserLogModelCreate(new LogModel(userLog, userLogInfos));
		assertEquals(response.getStatus(), HttpStatus.ACCEPTED);
	}

}
