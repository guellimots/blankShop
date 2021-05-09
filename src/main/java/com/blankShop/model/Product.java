package com.blankShop.model;


import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@DynamicInsert
@DynamicUpdate
@Entity
@Table(name = "product", uniqueConstraints = {
		@UniqueConstraint(columnNames = { "productName", "productID", "colorCode" ,"size"}) })
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer typeId;

	private String productName;

	private Integer productID;

	private String colorCode;

	private String size;
	@Column(nullable = false, updatable = false)
	private String inMarketDate;

	private Integer productPrice;

	private String genre;

	private String purpose;

	private String productStatus;

	private Integer salePrice;

	private String productDiscription1;

	private String productDiscription2;

	private Integer soldNumber;

	private Integer stockNumber;

	private Integer soldOnSale;

	private String productImgDir1;

	private String productImgDir2;

	private String productImgDir3;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
	@JsonIgnore
	private Set<Orders> orders;

	@Transient
	private MultipartFile multipartFile1;
	@Transient
	private MultipartFile multipartFile2;
	@Transient
	private MultipartFile multipartFile3;

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	

	

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public Integer getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}

	public String getProductDiscription1() {
		return productDiscription1;
	}

	public void setProductDiscription1(String productDiscription1) {
		this.productDiscription1 = productDiscription1;
	}

	public String getProductDiscription2() {
		return productDiscription2;
	}

	public void setProductDiscription2(String productDiscription2) {
		this.productDiscription2 = productDiscription2;
	}

	public Integer getSoldNumber() {
		return soldNumber;
	}

	public void setSoldNumber(Integer soldNumber) {
		this.soldNumber = soldNumber;
	}

	public Integer getStockNumber() {
		return stockNumber;
	}

	public void setStockNumber(Integer stockNumber) {
		this.stockNumber = stockNumber;
	}

	public Integer getSoldOnSale() {
		return soldOnSale;
	}

	public void setSoldOnSale(Integer soldOnSale) {
		this.soldOnSale = soldOnSale;
	}

	public String getProductImgDir1() {
		return productImgDir1;
	}

	public void setProductImgDir1(String productImgDir1) {
		this.productImgDir1 = productImgDir1;
	}

	public String getProductImgDir2() {
		return productImgDir2;
	}

	public void setProductImgDir2(String productImgDir2) {
		this.productImgDir2 = productImgDir2;
	}

	public String getProductImgDir3() {
		return productImgDir3;
	}

	public void setProductImgDir3(String productImgDir3) {
		this.productImgDir3 = productImgDir3;
	}

	public MultipartFile getMultipartFile1() {
		return multipartFile1;
	}

	public void setMultipartFile1(MultipartFile multipartFile1) {
		this.multipartFile1 = multipartFile1;
	}

	public MultipartFile getMultipartFile2() {
		return multipartFile2;
	}

	public void setMultipartFile2(MultipartFile multipartFile2) {
		this.multipartFile2 = multipartFile2;
	}

	public MultipartFile getMultipartFile3() {
		return multipartFile3;
	}

	public void setMultipartFile3(MultipartFile multipartFile3) {
		this.multipartFile3 = multipartFile3;
	}

	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

//	public Date getReciDate() {
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		// 進行轉換
//
//		try {
//			Date date = sdf.parse(reciDate);
//			return date;
//
//		} catch (ParseException e) {
//
//			e.printStackTrace();
//		}
//
//		return null;
//	}
//
//	public void setReciDate(String reciDate) {
//		this.reciDate = reciDate;
//	}

	public String getInMarketDate() {
		return inMarketDate;
	}

	public void setInMarketDate(String inMarketDate) {
		this.inMarketDate = inMarketDate;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
}
