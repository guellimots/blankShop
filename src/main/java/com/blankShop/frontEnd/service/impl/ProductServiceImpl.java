package com.blankShop.frontEnd.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.repository.ProductsRepository;
import com.blankShop.frontEnd.service.ProductService;
import com.blankShop.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductsRepository productDao;

	@Override
	public Product findTypeId(Integer typeId) {
		Optional<Product> product = productDao.findById(typeId);
		return product.get();
	}

	public List<Product> findAll() {
		return productDao.findAll();
	}

	public List<Product> findByProductID(Integer productId) {
		return productDao.findByProductIDAndProductStatusAndInMarketDateLessThan(productId, "上架中", "2021-05-14");
	}
	
	public List<Product> allProducts(){
		return productDao.allProducts();
	}
	
	public List<Product> itemsOfKeyword(String keyword){
		return productDao.itemsOfKeyword(keyword);
	}
	
	public List<Product> itemsOfGenre(String genre){
		return productDao.itemsOfGenre(genre);
	}
	
	public List<Product> onSaleItems(){
		return productDao.onSaleItems();
	}
	
	public List<Product> newProducts(String date1, String date2){
		return productDao.newProducts(date1, date2);
	}
	
	public List<Integer> bestsellers() {
		return productDao.bestsellers();
	}
	
	public Product findByProductIDAndColorCodeAndSize(Integer productID, String colorCode, String size) {
		Optional<Product> optional = productDao.findByProductIDAndColorCodeAndSize(productID, colorCode, size);
		Product product = null;
		if (optional.isPresent()) {
			product = optional.get();
		} else {
			throw new RuntimeException("Product(id=" + productID + ")不存在");
		}
		return product;
	}
	
	public List<Product> findByProductIDAndColorCode(Integer productID, String colorCode){
		return productDao.findByProductIDAndColorCode(productID, colorCode);
	}

	


}
