package com.experian.bepartner.service;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.RegisterModel;

public interface IRegisterService {

	public Payload register(RegisterModel registerModel);
}
