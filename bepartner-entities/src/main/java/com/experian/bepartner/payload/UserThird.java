package com.experian.bepartner.payload;

public class UserThird {

	private Integer idUserThird;
	private String vIdUserPublic;
	private String vIdThirdPublic;
	private Integer vEnable;

	public UserThird() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserThird(Integer idUserThird, String vIdUserPublic, String vIdThirdPublic, Integer vEnable) {
		super();
		this.idUserThird = idUserThird;
		this.vIdUserPublic = vIdUserPublic;
		this.vIdThirdPublic = vIdThirdPublic;
		this.vEnable = vEnable;
	}

	public Integer getIdUserThird() {
		return idUserThird;
	}

	public void setIdUserThird(Integer idUserThird) {
		this.idUserThird = idUserThird;
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

	public Integer getvEnable() {
		return vEnable;
	}

	public void setvEnable(Integer vEnable) {
		this.vEnable = vEnable;
	}

}
