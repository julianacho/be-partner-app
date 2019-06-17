package com.experian.bepartnerslog.enums;

public enum AddInfoLogEnum {
	PETICION_JSON("403001"), 
	ERROR_JSON("403002"), 
	IDENTIFICACION_USUARIO("403003"),
	TIP_IDENTIFICACION_USUARIO("403004"), 
	IDENTIFICACION_TERCERO("403005"), 
	TIP_IDENTIFICACION_TERCERO("403006");

	private final String value;

	private AddInfoLogEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
