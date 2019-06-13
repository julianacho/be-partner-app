package com.experian.bepartner.dal;

import java.util.List;

import com.experian.bepartner.payload.User;
import com.experian.bepartner.payload.UserInfo;

public interface IUserDal {
	
	public Object mpUserCreate(User usuario);
	
	public List<Object> mpUserInfoCreate(List<UserInfo> usuarioInfo);
}
