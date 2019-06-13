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
import com.experian.bepartner.payload.UserModel;
import com.experian.bepartner.service.IUserService;

@RestController
@RequestMapping("/api/user/create/")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService iUserService;

	@PostMapping("/create/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload create(@RequestBody UserModel userModel) {
		logger.debug("UserController.create:" + userModel.toString());
		Payload payload = iUserService.userModelCreate(userModel);
		return payload;
	}
}
