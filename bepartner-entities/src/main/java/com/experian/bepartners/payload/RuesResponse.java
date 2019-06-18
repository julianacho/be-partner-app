package com.experian.bepartners.payload;

public class RuesResponse {
	private String records;

	private String page;

	private String mensaje_error;

	private Rows[] rows;

	private String codigo_error;

	public String getRecords() {
		return records;
	}

	public void setRecords(String records) {
		this.records = records;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getMensaje_error() {
		return mensaje_error;
	}

	public void setMensaje_error(String mensaje_error) {
		this.mensaje_error = mensaje_error;
	}

	public Rows[] getRows() {
		return rows;
	}

	public void setRows(Rows[] rows) {
		this.rows = rows;
	}

	public String getCodigo_error() {
		return codigo_error;
	}

	public void setCodigo_error(String codigo_error) {
		this.codigo_error = codigo_error;
	}

	@Override
	public String toString() {
		return "ClassPojo [records = " + records + ", page = " + page + ", mensaje_error = " + mensaje_error
				+ ", rows = " + rows + ", codigo_error = " + codigo_error + "]";
	}
}
