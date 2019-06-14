package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;

public interface IUserDal {
	
	public User mpUserCreate(User usuario);
	
	public List<UserInfo> mpUserInfoCreate(List<UserInfo> usuarioInfo);
}
