package com.experian.bepartner.enums;

public enum CatalogThridInfoEnum {
	RAZON_SOCIAL("301001"), MAIL_FACTURACION("301002"), DIRECCION_CORRESPONDENCIA("301003"), CIUDAD("301004"),
	DEPARTAMENTO("301005"), VALIDATE_LIST("301006"), VALIDATE_RUES("301007");

	private final String value;

	private CatalogThridInfoEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
