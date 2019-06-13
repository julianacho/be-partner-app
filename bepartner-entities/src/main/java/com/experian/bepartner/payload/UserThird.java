package com.experian.bepartner.payload;

public class UserThird {

	private String vIdUserPublic;
	private String vIdThirdPublic;
	private String vEnable;

	public UserThird(String vIdUserPublic, String vIdThirdPublic, String vEnable) {
		super();
		this.vIdUserPublic = vIdUserPublic;
		this.vIdThirdPublic = vIdThirdPublic;
		this.vEnable = vEnable;
	}

	public String getvIdUserPublic() {
		return vIdUserPublic;
	}

	public void setvIdUserPublic(String vIdUserPublic) {
		this.vIdUserPublic = vIdUserPublic;
	}

	public String getvIdThirdPublic() {
		return vIdThirdPublic;
	}

	public void setvIdThirdPublic(String vIdThirdPublic) {
		this.vIdThirdPublic = vIdThirdPublic;
	}

	public String getvEnable() {
		return vEnable;
	}

	public void setvEnable(String vEnable) {
		this.vEnable = vEnable;
	}

}
