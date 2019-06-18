package com.experian.bepartners.payload;

public class Rows {
	private String estado;

	private String tipo;

	private String sigla;

	private String enlaceVer;

	private String codigo_estado;

	private String identificacion;

	private String razon_social;

	private String clase_identificacion;

	private String categoria_matricula;

	private String matricula;

	private String codigo_camara;

	private String nombre_camara;

	private String organizacion_juridica;

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getEnlaceVer() {
		return enlaceVer;
	}

	public void setEnlaceVer(String enlaceVer) {
		this.enlaceVer = enlaceVer;
	}

	public String getCodigo_estado() {
		return codigo_estado;
	}

	public void setCodigo_estado(String codigo_estado) {
		this.codigo_estado = codigo_estado;
	}

	public String getIdentificacion() {
		return identificacion;
	}

	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}

	public String getRazon_social() {
		return razon_social;
	}

	public void setRazon_social(String razon_social) {
		this.razon_social = razon_social;
	}

	public String getClase_identificacion() {
		return clase_identificacion;
	}

	public void setClase_identificacion(String clase_identificacion) {
		this.clase_identificacion = clase_identificacion;
	}

	public String getCategoria_matricula() {
		return categoria_matricula;
	}

	public void setCategoria_matricula(String categoria_matricula) {
		this.categoria_matricula = categoria_matricula;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getCodigo_camara() {
		return codigo_camara;
	}

	public void setCodigo_camara(String codigo_camara) {
		this.codigo_camara = codigo_camara;
	}

	public String getNombre_camara() {
		return nombre_camara;
	}

	public void setNombre_camara(String nombre_camara) {
		this.nombre_camara = nombre_camara;
	}

	public String getOrganizacion_juridica() {
		return organizacion_juridica;
	}

	public void setOrganizacion_juridica(String organizacion_juridica) {
		this.organizacion_juridica = organizacion_juridica;
	}

	@Override
	public String toString() {
		return "ClassPojo [estado = " + estado + ", tipo = " + tipo + ", sigla = " + sigla + ", enlaceVer = "
				+ enlaceVer + ", codigo_estado = " + codigo_estado + ", identificacion = " + identificacion
				+ ", razon_social = " + razon_social + ", clase_identificacion = " + clase_identificacion
				+ ", categoria_matricula = " + categoria_matricula + ", matricula = " + matricula + ", codigo_camara = "
				+ codigo_camara + ", nombre_camara = " + nombre_camara + ", organizacion_juridica = "
				+ organizacion_juridica + "]";
	}
}
