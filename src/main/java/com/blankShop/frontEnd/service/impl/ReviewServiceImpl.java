package com.blankShop.frontEnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.repository.ReviewRepository;
import com.blankShop.frontEnd.service.ReviewService;
import com.blankShop.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewRepository reviewDao;
	
	public List<Review> findByProductId(Integer ProductId){
		
		return reviewDao.findByProductId(ProductId);
	}
	
	public void deleteById(Integer reviewId) {
	    reviewDao.deleteById(reviewId);
	}
	
	public Review save(Review review) {
		return reviewDao.save(review);
	}

}
