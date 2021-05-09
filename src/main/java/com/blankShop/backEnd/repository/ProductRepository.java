package com.blankShop.backEnd.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Product;




public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	public List<Product>findAll();
	
	public List<Product>findAllByProductStatus(String productStatus);
	
	public Optional<Product>findTop1ByOrderByProductIDDesc();
	
	public Optional<Product> findByProductIDAndColorCodeAndSize(Integer productID,String colorCode,String size);
	
	public List<Product> findByProductID(Integer productID);
	
	public List<Product> findAllByProductStatusAndStockNumberLessThan(String productStatus,Integer stock);
	
	public Optional<Product> findByColorCodeAndProductNameAndSize(String colorCode,String productName,String size);
	
	public List<Product> findSizeByColorCodeAndProductName(String colorCode,String productName);
	
	@Query(value = "select count(*) from Product", nativeQuery = true)
	public Integer gettotalProduct();
	
}
