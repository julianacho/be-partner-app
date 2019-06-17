package com.experian.bepartners.payload;

public class UserLog {
	private String vIdThirdPublic;
	private String vIdUserPublic;
	private String VIdRazon;
	private String VIdEstatus;
	private Integer idLogTransactionUser;

	public UserLog(String vIdThirdPublic, String vIdUserPublic, String vIdRazon, String vIdEstatus) {
		super();
		this.vIdThirdPublic = vIdThirdPublic;
		this.vIdUserPublic = vIdUserPublic;
		VIdRazon = vIdRazon;
		VIdEstatus = vIdEstatus;
	}

	public String getvIdThirdPublic() {
		return vIdThirdPublic;
	}

	public void setvIdThirdPublic(String vIdThirdPublic) {
		this.vIdThirdPublic = vIdThirdPublic;
	}

	public String getvIdUserPublic() {
		return vIdUserPublic;
	}

	public void setvIdUserPublic(String vIdUserPublic) {
		this.vIdUserPublic = vIdUserPublic;
	}

	public String getVIdRazon() {
		return VIdRazon;
	}

	public void setVIdRazon(String vIdRazon) {
		VIdRazon = vIdRazon;
	}

	public String getVIdEstatus() {
		return VIdEstatus;
	}

	public void setVIdEstatus(String vIdEstatus) {
		VIdEstatus = vIdEstatus;
	}

	public Integer getIdLogTransactionUser() {
		return idLogTransactionUser;
	}

	public void setIdLogTransactionUser(Integer idLogTransactionUser) {
		this.idLogTransactionUser = idLogTransactionUser;
	}

}
