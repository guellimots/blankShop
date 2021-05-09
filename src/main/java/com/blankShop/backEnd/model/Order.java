package com.blankShop.backEnd.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.DynamicUpdate;


@Entity
@Table(name = "orders")
@DynamicUpdate
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderIdentity;
	
	@Column(nullable = false, updatable = false)
	private Integer orderId;

	@Column(nullable = false, updatable = false)
	private Integer typeId;
	
	@Column(nullable = false, updatable = false)
	private Integer memberId;

	@Column(name = "price", nullable = false, updatable = false)
	private Integer price;

	@Column(name = "amount", nullable = false, updatable = false)
	private Integer amount;

	private String orderStatus;

	@Column(name = "paymentInfo", nullable = false, updatable = false)
	private String paymentInfo;

	@Column(name = "address", nullable = false, updatable = false)
	private String address;

	@Column(name = "createDate", nullable = false, updatable = false)
	private Date createDate;

	@Column(name = "modifDate", nullable = false, updatable = false)
	private Date modifDate;


	
	
	public Integer getOrderIdentity() {
		return orderIdentity;
	}

	public void setOrderIdentity(Integer orderIdentity) {
		this.orderIdentity = orderIdentity;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentInfo() {
		return paymentInfo;
	}

	public void setPaymentInfo(String paymentInfo) {
		this.paymentInfo = paymentInfo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifDate() {
		return modifDate;
	}

	public void setModifDate(Date modifDate) {
		this.modifDate = modifDate;
	}
	
	
}
