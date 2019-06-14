package com.experian.bepartner.enums;

public enum EnableEnum {
	HABILITADO(1), INHABILITADO(0);

	private final Integer value;

	private EnableEnum(Integer value) {
		this.value = value;
	}

	public Integer getValue() {
		return value;
	}

}