package com.experian.bepartner.payload;

import java.util.List;

public class UserModel {
	private User user;
	private List<UserInfo> userInfo;

	public UserModel(User user, List<UserInfo> userInfo) {
		super();
		this.user = user;
		this.userInfo = userInfo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<UserInfo> getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(List<UserInfo> userInfo) {
		this.userInfo = userInfo;
	}

}
