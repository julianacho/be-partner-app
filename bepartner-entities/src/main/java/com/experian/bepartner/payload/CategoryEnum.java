package com.experian.bepartner.payload;

public enum CategoryEnum {
	NIT(3), CECULA_CIUDADANIA(2), CEULA_EXT(1);

	private final Integer category;

	private CategoryEnum(Integer category) {
		this.category = category;
	}
}
