package com.experian.bepartners.payload;

public class UserThirdInfo {

	private String vIdType;
	private String vIdentificationNumber;
	private String vIdInfoTypeUser;
	private String vValue;

	public UserThirdInfo(String vIdType, String vIdentificationNumber, String vIdInfoTypeUser, String vValue) {
		super();
		this.vIdType = vIdType;
		this.vIdentificationNumber = vIdentificationNumber;
		this.vIdInfoTypeUser = vIdInfoTypeUser;
		this.vValue = vValue;
	}

	public String getvIdType() {
		return vIdType;
	}

	public void setvIdType(String vIdType) {
		this.vIdType = vIdType;
	}

	public String getvIdentificationNumber() {
		return vIdentificationNumber;
	}

	public void setvIdentificationNumber(String vIdentificationNumber) {
		this.vIdentificationNumber = vIdentificationNumber;
	}

	public String getvIdInfoTypeUser() {
		return vIdInfoTypeUser;
	}

	public void setvIdInfoTypeUser(String vIdInfoTypeUser) {
		this.vIdInfoTypeUser = vIdInfoTypeUser;
	}

	public String getvValue() {
		return vValue;
	}

	public void setvValue(String vValue) {
		this.vValue = vValue;
	}

}
