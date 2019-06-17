package com.experian.bepartner.service;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;

public interface IRegisterService {

	public Payload register(RegisterModel registerModel);
}
