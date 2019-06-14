package com.experian.bepartner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.RegisterModel;
import com.experian.bepartner.service.IUserThirdService;

@RestController
@RequestMapping("/api/userthird/create/")
public class UserThirdController {

	private static final Logger logger = LoggerFactory.getLogger(UserThirdController.class);

	@Autowired
	private IUserThirdService iUserThirdService;

	@PostMapping("/create/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload create(@RequestBody RegisterModel userThirdModel) {
		logger.debug("UserThirdController.create:" + userThirdModel.toString());
//		Payload payload = iUserThirdService.mpUserThridCreate(userThirdModel);
		return null;
	}

}
