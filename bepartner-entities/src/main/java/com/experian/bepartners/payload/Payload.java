package com.experian.bepartners.payload;

import java.io.Serializable;

import org.springframework.http.HttpStatus;

public class Payload implements Serializable {
	private HttpStatus status;
	private Object content;
	private String message;

	public Payload() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payload(HttpStatus status, Object content) {
		super();
		this.status = status;
		this.content = content;
	}

	public Payload(HttpStatus status) {
		super();
		this.status = status;
	}

	public HttpStatus getStatus() {
		return status;
	}

	public void setStatus(HttpStatus status) {
		this.status = status;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
