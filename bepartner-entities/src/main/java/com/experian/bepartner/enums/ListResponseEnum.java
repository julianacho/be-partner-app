package com.experian.bepartner.enums;

public enum ListResponseEnum {
	REPORTADO("102001"), NO_REPORTADO("102002"), ERROR_CONSULTA_LISTAS("102003");

	private final String value;

	private ListResponseEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
