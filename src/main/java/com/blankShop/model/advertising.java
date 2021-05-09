package com.blankShop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Advertising")
@Component("advertising")
@DynamicInsert
@DynamicUpdate
public class advertising {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	private String title;
	
	@Column(name = "img", nullable = false, updatable = false)
	private byte[] img;
		
	
	private String status;

	@Column(name = "createDate", nullable = true, updatable = false)
	private String createDate;
	
	@Column(name = "modifDate", nullable = true, updatable = false)
	private String modifDate;
	
	public advertising() {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifDate() {
		return modifDate;
	}

	public void setModifDate(String modifDate) {
		this.modifDate = modifDate;
	}

	
	
}
