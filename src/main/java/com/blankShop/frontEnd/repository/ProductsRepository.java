package com.blankShop.frontEnd.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Product;

public interface ProductsRepository  extends JpaRepository<Product, Integer>{
	
	@Query(value="select * from Product where ProductID = ?1 and inMarketDate <='2021-05-14' and productStatus='上架中' ", nativeQuery=true)
	List<Product> findWithProductID(Integer productId);
	
	@Query(value="select * from Product where inMarketDate <='2021-05-14' and productStatus='上架中' ", nativeQuery=true)
	List<Product> allProducts();
	
	@Query(value="select * from Product where productName like ?1 and inMarketDate <='2021-05-14' and productStatus='上架中' ", nativeQuery=true)
	List<Product> itemsOfKeyword(String keyword);
	
	@Query(value="select * from Product where genre=?1 and inMarketDate <='2021-05-14' and productStatus='上架中' ", nativeQuery=true)
	List<Product> itemsOfGenre(String genre);
	
	@Query(value="select * from Product where salePrice!=0 and inMarketDate <='2021-05-14' and productStatus='上架中' ", nativeQuery=true)
	List<Product> onSaleItems();
	
	@Query(value="select * from Product where inMarketDate between ?1 and ?2 and productStatus='上架中' ", nativeQuery=true)
	List<Product> newProducts(String date1, String date2);
	
	@Query(value="select Top(5) productId from Product where inMarketDate <= '2021-05-14' and productStatus='上架中' group by productId order by SUM(soldNumber) DESC", nativeQuery=true)
	List<Integer> bestsellers();
	
	Optional<Product> findByProductIDAndColorCodeAndSize(Integer productID, String colorCode, String size);
	
	List<Product> findByProductIDAndColorCode(Integer productID, String colorCode);
	
}
