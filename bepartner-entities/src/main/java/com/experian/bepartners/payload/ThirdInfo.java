package com.experian.bepartners.payload;

import java.io.Serializable;

public class ThirdInfo implements Serializable {

	private Long Id_Third_InfioPrimaria;
	private Long Id_Third;
	private String V_Id_Third_Public;
	private String V_Id_Info_Type_Third;
	private String V_Value;
	private Integer V_Enable;

	public ThirdInfo(String v_Id_Third_Public, String v_Id_Info_Type_Third, String v_Value, Integer v_Enable) {
		super();
		V_Id_Third_Public = v_Id_Third_Public;
		V_Id_Info_Type_Third = v_Id_Info_Type_Third;
		V_Value = v_Value;
		V_Enable = v_Enable;
	}

	public ThirdInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId_Third_InfioPrimaria() {
		return Id_Third_InfioPrimaria;
	}

	public void setId_Third_InfioPrimaria(Long id_Third_InfioPrimaria) {
		Id_Third_InfioPrimaria = id_Third_InfioPrimaria;
	}

	public Long getId_Third() {
		return Id_Third;
	}

	public void setId_Third(Long id_Third) {
		Id_Third = id_Third;
	}

	public String getV_Id_Third_Public() {
		return V_Id_Third_Public;
	}

	public void setV_Id_Third_Public(String v_Id_Third_Public) {
		V_Id_Third_Public = v_Id_Third_Public;
	}

	public String getV_Id_Info_Type_Third() {
		return V_Id_Info_Type_Third;
	}

	public void setV_Id_Info_Type_Third(String v_Id_Info_Type_Third) {
		V_Id_Info_Type_Third = v_Id_Info_Type_Third;
	}

	public String getV_Value() {
		return V_Value;
	}

	public void setV_Value(String v_Value) {
		V_Value = v_Value;
	}

	public Integer getV_Enable() {
		return V_Enable;
	}

	public void setV_Enable(Integer v_Enable) {
		V_Enable = v_Enable;
	}

}
