package com.experian.bepartnerslog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartners.payload.LogModel;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartnerslog.service.ILogRegistroService;

@RestController
@RequestMapping("/api/log/")
public class LogRegistroController {

	private static final Logger logger = LoggerFactory.getLogger(LogRegistroController.class);

	@Autowired
	private ILogRegistroService iLogRegistroService;

	@PostMapping("/create/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload create(@RequestBody LogModel logModel) {
		logger.debug("LogRegistroController.create:" + logModel.toString());
		Payload payload = iLogRegistroService.mpUserLogModelCreate(logModel);
		return payload;
	}
}
