package com.experian.bepartner.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartner.dal.IThirdDal;
import com.experian.bepartner.dal.IUserDal;
import com.experian.bepartner.dal.IUserThridDal;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.RegisterModel;
import com.experian.bepartners.payload.UserThird;

@Service
@Transactional
public class UserThirdService implements IUserThirdService {

	private static final Logger logger = LoggerFactory.getLogger(UserThirdService.class);

	@Autowired
	private IUserDal iUserDal;

	@Autowired
	private IThirdDal iThirdDal;

	@Autowired
	private IUserThridDal iUserThridDal;

	@Override
	public Payload mpUserThridCreate(UserThird userThird) {
		try {
			UserThird userThirdResponse = iUserThridDal.mpUserThridCreate(userThird);
			return new Payload(HttpStatus.ACCEPTED, userThirdResponse);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

}
