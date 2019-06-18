package com.experian.servicebroker.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.RuesRequest;
import com.experian.servicebroker.service.IRegisterService;

@RestController
@RequestMapping("/v1/catalog/register/")
public class RegisterServiceController {

	private static final Logger logger = LoggerFactory.getLogger(RegisterServiceController.class);

	@Autowired
	private IRegisterService iRegisterService;

	@PostMapping("/send/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload send(@RequestBody RegisterModel registerModel) {
		logger.debug("RuesController.send:" + registerModel.toString());
		Payload payload = iRegisterService.register(registerModel);
		return payload;
	}

}
