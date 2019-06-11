package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.UserThird;
import com.experian.bepartner.payload.UserThirdInfo;

public interface IUserThridDal {

	public Object mpUserThridCreate(UserThird userThird);
	
	public List<Object> mpUserThridInfoCreate(List<UserThirdInfo> userThirdInfos);
}
