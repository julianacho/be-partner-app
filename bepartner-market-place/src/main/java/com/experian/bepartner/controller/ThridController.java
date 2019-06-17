package com.experian.bepartner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartner.service.IThirdService;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.ThirdModel;

@RestController
@RequestMapping("/api/third/create/")
public class ThridController {

	private static final Logger logger = LoggerFactory.getLogger(ThridController.class);

	@Autowired
	private IThirdService iThirdService;

	@PostMapping("/create/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload create(@RequestBody ThirdModel thirdModel) {
		logger.debug("ThridController.create:" + thirdModel.toString());
		Payload payload = iThirdService.thirdModelCreate(thirdModel);
		return payload;
	}

}
