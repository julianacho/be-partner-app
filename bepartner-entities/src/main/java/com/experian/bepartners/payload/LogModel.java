package com.experian.bepartners.payload;

import java.util.List;

public class LogModel {
	private UserLog userLog;
	private List<UserLogInfo> userLogInfos;

	public LogModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LogModel(UserLog userLog, List<UserLogInfo> userLogInfos) {
		super();
		this.userLog = userLog;
		this.userLogInfos = userLogInfos;
	}

	public UserLog getUserLog() {
		return userLog;
	}

	public void setUserLog(UserLog userLog) {
		this.userLog = userLog;
	}

	public List<UserLogInfo> getUserLogInfos() {
		return userLogInfos;
	}

	public void setUserLogInfos(List<UserLogInfo> userLogInfos) {
		this.userLogInfos = userLogInfos;
	}

}
