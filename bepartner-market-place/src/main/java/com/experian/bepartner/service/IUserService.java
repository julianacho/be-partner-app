package com.experian.bepartner.service;

import java.util.List;

import com.experian.bepartners.payload.Payload;
import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;
import com.experian.bepartners.payload.UserModel;

public interface IUserService {

	public Payload userModelCreate(UserModel userModel);

	public Payload userCreate(User user);

	public Payload userInfoCreate(List<UserInfo> userInfo);

	public Payload findByIdentify(String idType, String identificationNumber);
}
