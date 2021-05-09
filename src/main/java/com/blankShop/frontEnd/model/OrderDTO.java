package com.blankShop.frontEnd.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDTO {
	private Integer orderIdentity;
	private Integer orderId;
	private String productname;
	private Integer price;
	private Integer amount;
	private String orderStatus;
	private Date createDate;
	private String imgpath;
	private Integer totalPrice;
	private String paymentId;
	private String ezAdd;
	private String ezName;
	private String address;

	public String getEzAdd() {
		return ezAdd;
	}
	public void setEzAdd(String ezAdd) {
		this.ezAdd = ezAdd;
	}
	public String getEzName() {
		return ezName;
	}
	public void setEzName(String ezName) {
		this.ezName = ezName;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
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
	public Date getCreateDate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		sdf.pcreateDate
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public Integer getOrderIdentity() {
		return orderIdentity;
	}
	public void setOrderIdentity(Integer orderIdentity) {
		this.orderIdentity = orderIdentity;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
