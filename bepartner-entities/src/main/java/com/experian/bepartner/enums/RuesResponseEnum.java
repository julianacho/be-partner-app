package com.experian.bepartner.enums;

public enum RuesResponseEnum {
	APROBADO("105001"), RECHAZADO("105002"), ERROR_CONSULTA("105003"),IDENTIFICACION_NO_EXISTE("105004");

	private final String value;

	private RuesResponseEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
