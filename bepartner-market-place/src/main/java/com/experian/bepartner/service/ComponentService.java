package com.experian.bepartner.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartners.entity.UCatalog;

@Service
public class ComponentService implements IComponentService {

	private static final Logger logger = LoggerFactory.getLogger(ComponentService.class);

	

	@Override
	public Payload save(UCatalog infoPrecargado) {
		logger.debug("InfoPrecargadoService.save: " + infoPrecargado.toString());

		return new Payload(HttpStatus.ACCEPTED);
	}

	@Override
	public Payload delete(String id) {
		logger.debug("InfoPrecargadoService.delete: " + id);

		return new Payload(HttpStatus.ACCEPTED);
	}

	@Override
	public Payload get(String id) {
		logger.debug("InfoPrecargadoService.get: " + id);

		return new Payload(HttpStatus.ACCEPTED);
	}

	@Override
	public Payload findByNit(String nit) {
		logger.debug("InfoPrecargadoService.finfByNit: " + nit);

		return new Payload(HttpStatus.ACCEPTED);
	}

	@Override
	public Payload list(Pageable pageable) {
		logger.debug("InfoPrecargadoService.list: [Offset:"+pageable.getOffset()+",PageNumber:"+pageable.getPageNumber()+",PageSize:"+pageable.getPageSize()+",Sort:"+pageable.getSort()+"]");

		return new Payload(HttpStatus.ACCEPTED);
	}

}
