package com.experian.bepartner.payload;

public class Usuario {
	private String vIdType;
	private String vIdentificationNumber;
	private String vName;
	private String vLastName;
	private String vEmail;
	private String vPhone;
	private String vProfilePicture;

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

	public String getvName() {
		return vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
	}

	public String getvLastName() {
		return vLastName;
	}

	public void setvLastName(String vLastName) {
		this.vLastName = vLastName;
	}

	public String getvEmail() {
		return vEmail;
	}

	public void setvEmail(String vEmail) {
		this.vEmail = vEmail;
	}

	public String getvPhone() {
		return vPhone;
	}

	public void setvPhone(String vPhone) {
		this.vPhone = vPhone;
	}

	public String getvProfilePicture() {
		return vProfilePicture;
	}

	public void setvProfilePicture(String vProfilePicture) {
		this.vProfilePicture = vProfilePicture;
	}

}
