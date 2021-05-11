package com.blankShop.backEnd.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	public List<Product> findAll();

	public List<Product> findAllByProductStatus(String productStatus);

	public Optional<Product> findTop1ByOrderByProductIDDesc();

	public Optional<Product> findByProductIDAndColorCodeAndSize(Integer productID, String colorCode, String size);

	public List<Product> findByProductID(Integer productID);

	public List<Product> findAllByProductStatusAndStockNumberLessThan(String productStatus, Integer stock);

	public Optional<Product> findByColorCodeAndProductNameAndSize(String colorCode, String productName, String size);

	public List<Product> findSizeByColorCodeAndProductName(String colorCode, String productName);
	
	public List<Product> findByColorCodeAndProductID(String colorCode, Integer ProductID);

	@Query(value = "select count(*) from Product", nativeQuery = true)
	public Integer gettotalProduct();

	@Query(value = "select productID,productName,sum(soldNumber)soldNumber from Product where productStatus='上架中' group by productID,productName order by productID", nativeQuery = true)
	public List<Map<String, Object>> getProductChart();
	@Modifying
	@Query(value = "UPDATE Product SET productName = ? ,salePrice=? WHERE productID=? AND colorCode =?",nativeQuery = true )
	public void updateProductName(String productName,Integer salePrice,Integer productID,String colorCode);
	

}
