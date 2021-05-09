package com.blankShop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Department")
@Component("department")
public class Department {

	@Column(name = "deptNo", unique = true, nullable = false)
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer deptNo;
	
	private String deptName;
	
	
	public Department() {
	}


	public Integer getDeptNo() {
		return deptNo;
	}


	public void setDeptNo(Integer deptNo) {
		this.deptNo = deptNo;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	
}
