package com.experian.bepartners.payload;

import java.io.Serializable;

public class ThirdInfo implements Serializable {

	private Long IdThirdInfioPrimaria;
	private Long IdThird;
	private String VIdThirdPublic;
	private String VIdInfoTypeThird;
	private String VValue;
	private Integer VEnable;

	public ThirdInfo(String vIdThirdPublic, String vIdInfoTypeThird, String vValue, Integer vEnable) {
		super();
		VIdThirdPublic = vIdThirdPublic;
		VIdInfoTypeThird = vIdInfoTypeThird;
		VValue = vValue;
		VEnable = vEnable;
	}

	public ThirdInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getIdThirdInfioPrimaria() {
		return IdThirdInfioPrimaria;
	}

	public void setIdThirdInfioPrimaria(Long idThirdInfioPrimaria) {
		IdThirdInfioPrimaria = idThirdInfioPrimaria;
	}

	public Long getIdThird() {
		return IdThird;
	}

	public void setIdThird(Long idThird) {
		IdThird = idThird;
	}

	public String getVIdThirdPublic() {
		return VIdThirdPublic;
	}

	public void setVIdThirdPublic(String vIdThirdPublic) {
		VIdThirdPublic = vIdThirdPublic;
	}

	public String getVIdInfoTypeThird() {
		return VIdInfoTypeThird;
	}

	public void setVIdInfoTypeThird(String vIdInfoTypeThird) {
		VIdInfoTypeThird = vIdInfoTypeThird;
	}

	public String getVValue() {
		return VValue;
	}

	public void setVValue(String vValue) {
		VValue = vValue;
	}

	public Integer getVEnable() {
		return VEnable;
	}

	public void setVEnable(Integer vEnable) {
		VEnable = vEnable;
	}

}
