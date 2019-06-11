package com.experian.bepartnerslog.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "USER_LOGIN")
public class UserLogin {

	@Id
	@Column(name = "id_user_login")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUserLogin;

	@Column(name = "id_user")
	private Long idUser;

	@Column(name = "date_time_execution")
	@Temporal(TemporalType.DATE)
	private Date dateTimeExecution;

	public Long getIdUserLogin() {
		return idUserLogin;
	}

	public void setIdUserLogin(Long idUserLogin) {
		this.idUserLogin = idUserLogin;
	}

	public Long getIdUser() {
		return idUser;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}

	public Date getDateTimeExecution() {
		return dateTimeExecution;
	}

	public void setDateTimeExecution(Date dateTimeExecution) {
		this.dateTimeExecution = dateTimeExecution;
	}

}
