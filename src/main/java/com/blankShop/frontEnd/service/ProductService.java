package com.blankShop.frontEnd.service;

import java.util.List;

import com.blankShop.model.Product;

public interface ProductService {

Product findTypeId(Integer typeId);
	
	List<Product> findByProductID(Integer productId);

	List<Product> allProducts();
	
	List<Product> itemsOfKeyword(String keyword);
	
	List<Product> itemsOfGenre(String genre);
	
	List<Product> onSaleItems();
	
	List<Product> newProducts(String date1, String date2);
	
	List<Integer> bestsellers();
	
	Product findByProductIDAndColorCodeAndSize(Integer productID, String colorCode, String size);

}