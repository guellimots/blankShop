package com.blankShop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.util.Base64Utils;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Review")
public class Review {
    
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewId;
	
	@Transient
	private Integer memberId;
	
	@Transient
	private String profileImgSrc;
	
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "memberId", nullable = false, updatable = false)
	private Member member;
	
	private Integer productId;
	private String reviewName;
	private String reviewContent;

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getMemberId() {
		return this.member.getMemberId();
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getReviewName() {
		return reviewName;
	}

	public void setReviewName(String reviewName) {
		this.reviewName = reviewName;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getProfileImgSrc() {
		String imgUrl="";
		
		if (this.member.getProfileImg()==null) {
			imgUrl="/blankShop/assets/img/no-image.png";
		}
		else {
			byte[] base64 = Base64Utils.encode(this.member.getProfileImg());
			String strbase64 = new String(base64);
			imgUrl="data:image/png;base64," + strbase64;
		}
		return imgUrl;
	}

	public void setProfileImgSrc(String profileImgSrc) {
		this.profileImgSrc = profileImgSrc;
	}

		
	

}
