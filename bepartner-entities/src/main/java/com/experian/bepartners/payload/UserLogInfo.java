package com.experian.bepartners.payload;

public class UserLogInfo {
	private Integer vIdLogTransactionUser;
	private String vValue;
	private String vTransactionType;

	public UserLogInfo(String vValue, String vTransactionType) {
		super();
		this.vValue = vValue;
		this.vTransactionType = vTransactionType;
	}

	public Integer getvIdLogTransactionUser() {
		return vIdLogTransactionUser;
	}

	public void setvIdLogTransactionUser(Integer vIdLogTransactionUser) {
		this.vIdLogTransactionUser = vIdLogTransactionUser;
	}

	public String getvValue() {
		return vValue;
	}

	public void setvValue(String vValue) {
		this.vValue = vValue;
	}

	public String getvTransactionType() {
		return vTransactionType;
	}

	public void setvTransactionType(String vTransactionType) {
		this.vTransactionType = vTransactionType;
	}

}
