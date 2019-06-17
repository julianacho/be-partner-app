package com.experian.bepartner.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.experian.bepartner.dal.IUserDal;
import com.experian.bepartner.payload.Payload;
import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;
import com.experian.bepartner.payload.UserModel;
import com.experian.bepartners.entity.MpUser;
import com.experian.bepartners.repository.IMpUserRepository;

@Service
public class UserService implements IUserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private IUserDal iUserDal;

	@Autowired
	private IMpUserRepository iMpUserRepository;

	@Override
	public Payload userModelCreate(UserModel userModel) {
		User user=iUserDal.mpUserCreate(userModel.getUser());
		for(UserInfo userInfo:userModel.getUserInfo()) {
			userInfo.setvIdUserPublic(user.getvIdUserPublic());
		}
		List<UserInfo> userInfos= iUserDal.mpUserInfoCreate(userModel.getUserInfo());
		
		return new Payload(HttpStatus.ACCEPTED,new UserModel(user, userInfos));
	}	

	@Override
	public Payload userCreate(User user) {
		User userObj = iUserDal.mpUserCreate(user);
		return new Payload(HttpStatus.ACCEPTED, userObj);
	}

	@Override
	public Payload userInfoCreate(List<UserInfo> userInfo) {
		List<UserInfo> userInfoObj = iUserDal.mpUserInfoCreate(userInfo);
		return new Payload(HttpStatus.ACCEPTED, userInfoObj);
	}
	
	@Override
	public Payload findByIdentify(String idType, String identificationNumber) {
		MpUser mpUser = iMpUserRepository.findByIdentify(idType, identificationNumber);
		if (mpUser != null)
			new Payload(HttpStatus.ACCEPTED, mpUser);
		return new Payload(HttpStatus.NO_CONTENT);
	}

}