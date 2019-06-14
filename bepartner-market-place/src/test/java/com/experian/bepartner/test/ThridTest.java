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
import com.experian.bepartner.dal.ProductDal;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.Third;
import com.experian.bepartner.payload.ThirdInfo;
import com.experian.bepartner.payload.ThirdModel;
import com.experian.bepartner.service.IThirdService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class})
public class ThridTest {

	private static final Logger logger = LoggerFactory.getLogger(ThridTest.class);
	
	@Autowired
	private IThirdService iThirdService;
	
	@Test
	public void createThirdModel() {
		
		Payload payloadThirdExist=iThirdService.findByIdentify("IDENIT", "7775154024");
		if(payloadThirdExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
			
			Third third=new Third("", "IDENIT", "7775154024", "Empresa X1", 1);
			ThirdInfo thirdInfoTHIDS=new ThirdInfo("", "THIDS", "prueba 1", 1);
			ThirdInfo thirdInfoEGSD=new ThirdInfo("", "EGSD", "prueba 2",1);
			
			List<ThirdInfo> thirdInfos=new ArrayList<ThirdInfo>();
			thirdInfos.add(thirdInfoTHIDS);
			thirdInfos.add(thirdInfoEGSD);
			ThirdModel thirdModel=new ThirdModel(third, thirdInfos);
			
			Payload thirdInfoCreate=iThirdService.thirdModelCreate(thirdModel);
			assertEquals(thirdInfoCreate.getStatus(), HttpStatus.ACCEPTED);
		}	
	}
	
	@Test
	public void createThirdAndThirdInfo() {
		
		Payload payloadThirdExist=iThirdService.findByIdentify("IDENIT", "5553053124");
		if(payloadThirdExist.getStatus().equals(HttpStatus.NO_CONTENT)) {
			
			Third third=new Third("", "IDENIT", "5553053124", "Empresa X2", 1);
			
			Payload payloadThirdResult=iThirdService.thirdCreate(third);
			if(payloadThirdResult.getStatus().equals(HttpStatus.ACCEPTED)) {
				Third thirdResult=(Third) payloadThirdResult.getContent();
				
				ThirdInfo thirdInfoTHIDS=new ThirdInfo(thirdResult.getV_Id_Third_Public(), "THIDS", "Test 1", 1);
				ThirdInfo thirdInfoEGSD=new ThirdInfo(thirdResult.getV_Id_Third_Public(), "EGSD", "Test 2", 1);
				
				List<ThirdInfo> thirdInfos=new ArrayList<ThirdInfo>();
				thirdInfos.add(thirdInfoTHIDS);
				thirdInfos.add(thirdInfoEGSD);
				
				Payload thirdInfoResponse=iThirdService.thirdInfoCreate(thirdInfos);
				
				assertEquals(thirdInfoResponse.getStatus(), HttpStatus.ACCEPTED);
				
			}
			
			
		}	
	}
}
