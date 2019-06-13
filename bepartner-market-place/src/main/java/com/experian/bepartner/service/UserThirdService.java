package com.experian.bepartner.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.experian.bepartner.dal.IThirdDal;
import com.experian.bepartner.dal.IUserDal;
import com.experian.bepartner.dal.IUserThridDal;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.UserThird;
import com.experian.bepartner.payload.UserThirdModel;

@Service
public class UserThirdService implements IUserThirdService {

	private static final Logger logger = LoggerFactory.getLogger(UserThirdService.class);
	
	@Autowired
	private IUserDal iUserDal;
	
	@Autowired
	private IThirdDal iThirdDal;
	
	@Autowired
	private IUserThridDal iUserThridDal;
	
	@Override
	public Payload userThirdCreate(UserThirdModel userThirdModel) {
		iUserDal.mpUserCreate(userThirdModel.getUser());
		iUserDal.mpUserInfoCreate(userThirdModel.getUserInfo());
		
		iThirdDal.mpThirdCreate(userThirdModel.getThird());
		
		
		return new Payload(HttpStatus.ACCEPTED);
	}

	@Override
	public Object mpUserThridCreate(UserThird userThird) {
		iUserThridDal.mpUserThridCreate(userThird);
		return new Payload(HttpStatus.ACCEPTED);
	}

}
