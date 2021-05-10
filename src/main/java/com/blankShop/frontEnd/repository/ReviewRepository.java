package com.blankShop.frontEnd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
	List<Review> findByProductId(Integer ProductId);
}
