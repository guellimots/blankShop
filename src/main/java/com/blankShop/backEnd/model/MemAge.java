package com.blankShop.backEnd.model;

import javax.persistence.Entity;


public class MemAge {
	
	private Integer memberId;
	private String memberName;
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	private Integer age;
	private Integer spending;
	
	private Integer level;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSpending() {
		return spending;
	}

	public void setSpending(Integer spending) {
		this.spending = spending;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	

}
