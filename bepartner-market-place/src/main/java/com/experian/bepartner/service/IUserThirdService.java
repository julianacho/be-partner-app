package com.experian.bepartner.service;

import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.UserThird;
import com.experian.bepartner.payload.UserThirdModel;

public interface IUserThirdService {
	public Payload userThirdCreate(UserThirdModel userThirdModel);
	
	public Object mpUserThridCreate(UserThird userThird);
}
