package com.experian.bepartner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/inforecargado/")
public class InfoPrecargadoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoPrecargadoController.class);


	@GetMapping(value = "/test")
	public String getValue() {

		
		return "hola";
	}

	@PostMapping("/save/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload save(@RequestBody String infoPrecargado) {
		logger.debug("InfoPrecargadoController.save:" + infoPrecargado.toString());
		return new Payload(HttpStatus.ACCEPTED);
	}

	@PostMapping("/delete/{id}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload delete(@PathVariable String id) {
		logger.debug("InfoPrecargadoController.delete:" + id);
		return new Payload(HttpStatus.ACCEPTED);

	}

	@GetMapping("/get/{id}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload get(@PathVariable String id) {
		logger.debug("InfoPrecargadoController.get:" + id);
		return new Payload(HttpStatus.ACCEPTED);

	}

	@GetMapping("/find/{nit}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload find(@PathVariable String nit) {
		logger.debug("InfoPrecargadoController.find:" + nit);
		return new Payload(HttpStatus.ACCEPTED);

	}

	@GetMapping("/all/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload all(Pageable pageable) {
//		serviceUnion.getAllUCatalog();
		return new Payload(HttpStatus.ACCEPTED);

	}

}
