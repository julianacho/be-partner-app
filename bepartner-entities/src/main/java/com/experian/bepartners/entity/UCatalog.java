package com.experian.bepartners.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "U_CATALOG")
@NamedNativeQueries({ 
	  @NamedNativeQuery(
	    name = "pUCatalog", 
	    query = "CALL p_u_catalog()", 
	    resultClass = UCatalog.class) 
	})
public class UCatalog {

	@Id
	@Column(name = "id_catalog")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idCatalog;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "enable")
	private Long enable;

	@Column(name = "last_modify")
	@Temporal(TemporalType.DATE)
	private Date lastModify;

	@Column(name = "create_date")
	@Temporal(TemporalType.DATE)
	private Date createDate;

	public Long getIdCatalog() {
		return idCatalog;
	}

	public void setIdCatalog(Long idCatalog) {
		this.idCatalog = idCatalog;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getEnable() {
		return enable;
	}

	public void setEnable(Long enable) {
		this.enable = enable;
	}

	public Date getLastModify() {
		return lastModify;
	}

	public void setLastModify(Date lastModify) {
		this.lastModify = lastModify;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
