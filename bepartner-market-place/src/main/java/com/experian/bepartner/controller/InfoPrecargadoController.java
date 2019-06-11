package com.experian.bepartner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.experian.bepartner.client.IComponentService;
import com.experian.bepartner.dal.IProductDal;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.Product;
import com.experian.bepartner.service.ComponentService;
import com.experian.bepartner.service.ServiceUnion;
import com.experian.bepartners.entity.UCatalog;

@RestController
@RequestMapping("/api/inforecargado/")
public class InfoPrecargadoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoPrecargadoController.class);

	@Autowired
	private IComponentService iInfoPrecargado;
	
	@Autowired
	private ServiceUnion serviceUnion;
	
	@Autowired
	private IProductDal iProductDao;
	
	@GetMapping(value = "/test")
	public String getValue(){
		
		Product producto=new Product();
		producto.setVProductcode("FH-2314");
		producto.setVDescription("Producto FH-2314");
		producto.setVName("Producto FH-2314");
		producto.setVIdProductType("TYPE FH-2314");	

		iProductDao.mpProductCreate(producto, "");
		
	   return "hola";
	}

	@PostMapping("/save/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload save(@RequestBody UCatalog infoPrecargado) {
		logger.debug("InfoPrecargadoController.save:" + infoPrecargado.toString());
		Payload payload = iInfoPrecargado.save(infoPrecargado);
		return payload;
	}

	@PostMapping("/delete/{id}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload delete(@PathVariable String id) {
		logger.debug("InfoPrecargadoController.delete:" + id);
		Payload payload = iInfoPrecargado.delete(id);
		return payload;

	}

	@GetMapping("/get/{id}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload get(@PathVariable String id) {
		logger.debug("InfoPrecargadoController.get:" + id);
		Payload payload = iInfoPrecargado.get(id);
		return payload;

	}

	@GetMapping("/find/{nit}/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload find(@PathVariable String nit) {
		logger.debug("InfoPrecargadoController.find:" + nit);
		Payload payload = iInfoPrecargado.findByNit(nit);
		return payload;

	}
	
	@GetMapping("/all/")
	@CrossOrigin(origins = "*", maxAge = 3600)
	public Payload all(Pageable pageable) {
//		serviceUnion.getAllUCatalog();
		Product producto=new Product();
		producto.setVProductcode("CC-2314");
		producto.setVDescription("Producto CC-2314");
		producto.setVName("Producto CC-2314");
		producto.setVIdProductType("TYPE CC-2314");
		
//		iProductDao.paCrearProducto(producto);
		iProductDao.mpProductCreate(producto, "");
		logger.debug("InfoPrecargadoController.all:");
		Payload payload = iInfoPrecargado.list(pageable);
		return payload;

	}

}
