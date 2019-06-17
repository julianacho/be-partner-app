package com.experian.bepartner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartner.service.IRegisterService;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;

@RestController
@RequestMapping("/api/userthird/")
public class UserThirdController {

	private static final Logger logger = LoggerFactory.getLogger(UserThirdController.class);

	@Autowired
	private IRegisterService iRegisterService;

	@PostMapping("/create/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload create(@RequestBody RegisterModel registerModel) {
		logger.debug("UserThirdController.create:" + registerModel.toString());
		Payload register = iRegisterService.register(registerModel);
		return register;
	}

}
