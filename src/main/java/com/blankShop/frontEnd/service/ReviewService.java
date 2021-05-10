package com.blankShop.frontEnd.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.blankShop.model.Review;


public interface ReviewService {
	
	List<Review> findByProductId(Integer ProductId);
	void deleteById(Integer reviewId);
	Review save(Review review);

}
