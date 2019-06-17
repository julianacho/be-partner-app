package com.experian.bepartner.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.experian.bepartners.entity.UCatalog;
import com.experian.bepartners.payload.Payload;

public interface IComponentService {
	
	public Payload save(UCatalog infoPrecargado);
	public Payload delete(String id);
	public Payload get(String id);
	public Payload findByNit(String nit);
	public Payload list(Pageable pageable);
}
