package com.experian.bepartner.service;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.UserThird;
import com.experian.bepartner.payload.RegisterModel;

public interface IUserThirdService {
	public Payload userThirdCreate(RegisterModel userThirdModel);
	
	public Payload mpUserThridCreate(UserThird userThird);
}
