package com.blankShop.backEnd.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.blankShop.model.advertising;

public interface AdvertistingRepository extends JpaRepository<advertising, Integer> {
	
	@Query(value = "Select img From advertising where id = ? ", nativeQuery = true)
	public byte[] findAllImg(Integer id);	

}
