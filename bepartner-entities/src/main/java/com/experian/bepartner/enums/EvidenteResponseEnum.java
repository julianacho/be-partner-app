package com.experian.bepartner.enums;

public enum EvidenteResponseEnum {
	APROBADO("103001"), RECHAZADO("103002"), NO_EXISTE_IDENTIFICACION("103003"), NO_COINCIDEN_DATOS("103005"),
	VALIDO_CON_DOCUMENTO_NO_VIGENTE("103006");

	private final String value;

	private EvidenteResponseEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
