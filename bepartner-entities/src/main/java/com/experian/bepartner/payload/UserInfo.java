package com.experian.bepartner.payload;

public class UserInfo {
	private String vIdUserPublic;
	private String vIdInfoTypeUser;
	private String vValue;
	private Integer vEnable;

	public UserInfo(String vIdUserPublic, String vIdInfoTypeUser, String vValue, Integer vEnable) {
		super();
		this.vIdUserPublic = vIdUserPublic;
		this.vIdInfoTypeUser = vIdInfoTypeUser;
		this.vValue = vValue;
		this.vEnable = vEnable;
	}

	public String getvIdUserPublic() {
		return vIdUserPublic;
	}

	public void setvIdUserPublic(String vIdUserPublic) {
		this.vIdUserPublic = vIdUserPublic;
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

	public Integer getvEnable() {
		return vEnable;
	}

	public void setvEnable(Integer vEnable) {
		this.vEnable = vEnable;
	}

}
