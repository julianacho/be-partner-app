package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartners.payload.User;
import com.experian.bepartners.payload.UserInfo;

public interface IUserDal {
	
	public User mpUserCreate(User usuario) throws Exception;
	
	public List<UserInfo> mpUserInfoCreate(List<UserInfo> usuarioInfo) throws Exception;
}
