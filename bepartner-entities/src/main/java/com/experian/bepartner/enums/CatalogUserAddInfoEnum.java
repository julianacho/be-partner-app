package com.experian.bepartner.enums;

public enum CatalogUserAddInfoEnum {
	VALIDATE_LIST("201001"), VALIDATE_EVIDENTE("201002");

	private final String value;

	private CatalogUserAddInfoEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
