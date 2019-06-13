package com.experian.bepartner.payload;

import java.util.List;

public class UserThirdModel {

	private User user;
	private List<UserInfo> userInfo;
	private Third third;
	private List<ThirdInfo> thirdInfo;

	public UserThirdModel(User user, List<UserInfo> userInfo, Third third, List<ThirdInfo> thirdInfo) {
		super();
		this.user = user;
		this.userInfo = userInfo;
		this.third = third;
		this.thirdInfo = thirdInfo;
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

	public Third getThird() {
		return third;
	}

	public void setThird(Third third) {
		this.third = third;
	}

	public List<ThirdInfo> getThirdInfo() {
		return thirdInfo;
	}

	public void setThirdInfo(List<ThirdInfo> thirdInfo) {
		this.thirdInfo = thirdInfo;
	}

}
