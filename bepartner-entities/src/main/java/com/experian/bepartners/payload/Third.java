package com.experian.bepartners.payload;

import java.io.Serializable;

public class Third implements Serializable {

	private Integer Id_Third;
	private String v_Id_Third_Public;
	private String V_Id_Type;
	private String V_Identification_Number;
	private String V_Business_Name;
	private Integer V_Enable;

	public Third() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Third(String v_Id_Third_Public, String v_Id_Type, String v_Identification_Number, String v_Business_Name,
			Integer v_Enable) {
		super();
		this.v_Id_Third_Public = v_Id_Third_Public;
		V_Id_Type = v_Id_Type;
		V_Identification_Number = v_Identification_Number;
		V_Business_Name = v_Business_Name;
		V_Enable = v_Enable;
	}

	public Integer getId_Third() {
		return Id_Third;
	}

	public void setId_Third(Integer id_Third) {
		Id_Third = id_Third;
	}

	public String getV_Id_Third_Public() {
		return v_Id_Third_Public;
	}

	public void setV_Id_Third_Public(String v_Id_Third_Public) {
		this.v_Id_Third_Public = v_Id_Third_Public;
	}

	public String getV_Id_Type() {
		return V_Id_Type;
	}

	public void setV_Id_Type(String v_Id_Type) {
		V_Id_Type = v_Id_Type;
	}

	public String getV_Identification_Number() {
		return V_Identification_Number;
	}

	public void setV_Identification_Number(String v_Identification_Number) {
		V_Identification_Number = v_Identification_Number;
	}

	public String getV_Business_Name() {
		return V_Business_Name;
	}

	public void setV_Business_Name(String v_Business_Name) {
		V_Business_Name = v_Business_Name;
	}

	public Integer getV_Enable() {
		return V_Enable;
	}

	public void setV_Enable(Integer v_Enable) {
		V_Enable = v_Enable;
	}

}
