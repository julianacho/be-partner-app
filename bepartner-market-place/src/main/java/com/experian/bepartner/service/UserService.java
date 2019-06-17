package com.experian.bepartner.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.experian.bepartner.dal.IUserDal;
import com.experian.bepartners.entity.MpUser;
import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.experian.bepartners.payload.UserModel;
import com.experian.bepartners.repository.IMpUserRepository;

@Service
@Transactional
public class UserService implements IUserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private IUserDal iUserDal;

	@Autowired
	private IMpUserRepository iMpUserRepository;

	@Override
	public Payload userModelCreate(UserModel userModel) {
		try {
			User user = iUserDal.mpUserCreate(userModel.getUser());
			for (UserInfo userInfo : userModel.getUserInfo()) {
				userInfo.setvIdUserPublic(user.getvIdUserPublic());
			}
			List<UserInfo> userInfos = iUserDal.mpUserInfoCreate(userModel.getUserInfo());

			return new Payload(HttpStatus.ACCEPTED, new UserModel(user, userInfos));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload userCreate(User user) {
		try {
			User userObj = iUserDal.mpUserCreate(user);
			return new Payload(HttpStatus.ACCEPTED, userObj);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload userInfoCreate(List<UserInfo> userInfo) {
		try {
			List<UserInfo> userInfoObj = iUserDal.mpUserInfoCreate(userInfo);
			return new Payload(HttpStatus.ACCEPTED, userInfoObj);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

	@Override
	public Payload findByIdentify(String idType, String identificationNumber) {
		try {
			MpUser mpUser = iMpUserRepository.findByIdentify(idType, identificationNumber);
			if (mpUser != null)
				return new Payload(HttpStatus.ACCEPTED, mpUser);
			return new Payload(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new Payload(HttpStatus.CONFLICT, e.getMessage());
		}
	}

}
