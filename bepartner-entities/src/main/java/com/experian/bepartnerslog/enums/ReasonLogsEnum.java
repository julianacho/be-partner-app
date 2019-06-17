package com.experian.bepartnerslog.enums;

public enum ReasonLogsEnum {
	REGISTRO("401001"), CONSULTA_RUES("401002");

	private final String value;

	private ReasonLogsEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
