package com.experian.bepartner.service;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.UserThird;

public interface IUserThirdService {
	
	public Payload mpUserThridCreate(UserThird userThird);
}
