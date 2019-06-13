package com.experian.bepartners.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MP_THIRD")
public class MpThird {

	@Id
	@Column(name = "Id_Third")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idThird;

	@Column(name = "Id_Third_Public")
	private String idThirdPublic;

	@Column(name = "Id_Type")
	private String idType;

	@Column(name = "Identification_Number")
	private String identificationNumber;

	@Column(name = "Business_Name")
	private String businessName;

	@Column(name = "Enable")
	private String enable;

	public Long getIdThird() {
		return idThird;
	}

	public void setIdThird(Long idThird) {
		this.idThird = idThird;
	}

	public String getIdThirdPublic() {
		return idThirdPublic;
	}

	public void setIdThirdPublic(String idThirdPublic) {
		this.idThirdPublic = idThirdPublic;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdentificationNumber() {
		return identificationNumber;
	}

	public void setIdentificationNumber(String identificationNumber) {
		this.identificationNumber = identificationNumber;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

}
