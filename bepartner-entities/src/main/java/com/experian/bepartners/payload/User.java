package com.experian.bepartners.payload;

public class User {

	private String vIdUserPublic;
	private String vIdType;
	private String vIdentificationNumber;
	private String vName;
	private String vLastName;
	private String vEmail;
	private String vPhone;
	private String vProfilePicture;
	private Integer vEnable;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String vIdUserPublic, String vIdType, String vIdentificationNumber, String vName, String vLastName,
			String vEmail, String vPhone, String vProfilePicture, Integer vEnable) {
		super();
		this.vIdUserPublic = vIdUserPublic;
		this.vIdType = vIdType;
		this.vIdentificationNumber = vIdentificationNumber;
		this.vName = vName;
		this.vLastName = vLastName;
		this.vEmail = vEmail;
		this.vPhone = vPhone;
		this.vProfilePicture = vProfilePicture;
		this.vEnable = vEnable;
	}

	public String getvLastName() {
		return vLastName;
	}

	public void setvLastName(String vLastName) {
		this.vLastName = vLastName;
	}

	public String getvIdUserPublic() {
		return vIdUserPublic;
	}

	public void setvIdUserPublic(String vIdUserPublic) {
		this.vIdUserPublic = vIdUserPublic;
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

	public String getvName() {
		return vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
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

	public Integer getvEnable() {
		return vEnable;
	}

	public void setvEnable(Integer vEnable) {
		this.vEnable = vEnable;
	}

}
