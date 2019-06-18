package com.experian.servicebroker.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartners.entity.UCatalog;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RuesRequest;
import com.experian.servicebroker.service.IRuesService;

@RestController
@RequestMapping("/v1/catalog/rues/")
public class RuesController {

	private static final Logger logger = LoggerFactory.getLogger(RuesController.class);

	@Autowired
	private IRuesService iRuesService;

	@PostMapping("/send/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload send(@RequestBody RuesRequest ruesRequest) {
		logger.debug("RuesController.send:" + ruesRequest.toString());
		Payload payload = iRuesService.requestRues(ruesRequest);
		return payload;
	}

}
