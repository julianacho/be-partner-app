package com.experian.bepartnerslog.enums;

public enum StatusLogEnum {
	EXITO("402001"), ERROR("402002");

	private final String value;

	private StatusLogEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}