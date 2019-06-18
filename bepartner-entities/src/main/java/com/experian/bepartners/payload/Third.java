package com.experian.bepartners.payload;

import java.io.Serializable;

public class Third implements Serializable {

	private Integer IdThird;
	private String vIdThirdPublic;
	private String vIdType;
	private String vIdentificationNumber;
	private String vBusinessName;
	private Integer vEnable;

	public Third() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Third(String vIdThirdPublic, String vIdType, String vIdentificationNumber, String vBusinessName,
			Integer vEnable) {
		super();
		this.vIdThirdPublic = vIdThirdPublic;
		this.vIdType = vIdType;
		this.vIdentificationNumber = vIdentificationNumber;
		this.vBusinessName = vBusinessName;
		this.vEnable = vEnable;
	}

	public Integer getIdThird() {
		return IdThird;
	}

	public void setIdThird(Integer idThird) {
		IdThird = idThird;
	}

	public String getvIdThirdPublic() {
		return vIdThirdPublic;
	}

	public void setvIdThirdPublic(String vIdThirdPublic) {
		this.vIdThirdPublic = vIdThirdPublic;
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

	public String getvBusinessName() {
		return vBusinessName;
	}

	public void setvBusinessName(String vBusinessName) {
		this.vBusinessName = vBusinessName;
	}

	public Integer getvEnable() {
		return vEnable;
	}

	public void setvEnable(Integer vEnable) {
		this.vEnable = vEnable;
	}

}
