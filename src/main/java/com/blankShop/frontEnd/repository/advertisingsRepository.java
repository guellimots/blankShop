package com.blankShop.frontEnd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.advertising;


public interface advertisingsRepository extends JpaRepository<advertising, Integer>{
	
	@Query(value="select Top(5) *from advertising where status='Y' order by modifDate DESC", nativeQuery=true)
	List<advertising> findAds();

}
