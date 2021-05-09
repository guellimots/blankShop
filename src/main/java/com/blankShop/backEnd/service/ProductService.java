package com.blankShop.backEnd.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blankShop.model.Product;

import net.bytebuddy.asm.Advice.Return;

import com.blankShop.backEnd.dto.ProductSales;
import com.blankShop.backEnd.repository.ProductRepository;
import com.blankShop.backEnd.utils.FileUploadUtils;

@Service
@Transactional
public class ProductService {
	@Autowired
	ProductRepository productRepository;

	@Autowired
	FileUploadUtils fileUploadUtils;
	
	
	public void deleteById(Product product) {
		 productRepository.delete(product);
		
	}
	
	
	public List<Product> products() {

		return productRepository.findAllByProductStatus("上架中");
	}
	
	public List<Product> productdown() {

		return productRepository.findAllByProductStatus("下架中");
	}
	
	public List<Product> stocknotification() {

		return productRepository.findAllByProductStatusAndStockNumberLessThan("上架中",3);
	}

	public boolean update(Integer id, Product product) throws IOException {

		Optional<Product> productOptional = productRepository.findById(id);
		Product prod = productOptional.get();
		if (productOptional.isPresent()) {
			product.setProductStatus(prod.getProductStatus());
			product.setSoldNumber(prod.getSoldNumber());
			product.setSoldOnSale(prod.getSoldNumber());
			
			if (product.getMultipartFile1().isEmpty())
				product.setProductImgDir1(prod.getProductImgDir1());
			else {
				String ImgPath = fileUploadUtils.FileUpload(product.getMultipartFile1(), prod.getTypeId(), 1);
				product.setProductImgDir1(ImgPath);
			}
			if (product.getMultipartFile2().isEmpty())
				product.setProductImgDir2(prod.getProductImgDir2());
			else {
				String ImgPath2 = fileUploadUtils.FileUpload(product.getMultipartFile2(), prod.getTypeId(), 2);
				product.setProductImgDir2(ImgPath2);
			}
			if (product.getMultipartFile3().isEmpty())
				product.setProductImgDir3(prod.getProductImgDir3());
			else {
				String ImgPath3 = fileUploadUtils.FileUpload(product.getMultipartFile3(), prod.getTypeId(), 3);
				product.setProductImgDir3(ImgPath3);
			}
			
			productRepository.save(product);
			return true;
		}
		return false;
	}

	public Product findById(Integer id) {
		Optional<Product> product = productRepository.findById(id);

		return product.get();
	}

	public boolean StatusDown(Integer id) {
		Optional<Product> product = productRepository.findById(id);
		if (product.isPresent()) {
			product.get().setProductStatus("下架中");

			return true;
		}
		return false;
	}
	public boolean StatusUp(Integer id) {
		Optional<Product> product = productRepository.findById(id);
		if (product.isPresent()) {
			product.get().setProductStatus("上架中");
			
			return true;
		}
		return false;
	}
	

	public synchronized boolean insert(Product product) throws IOException {
		
		if(productRepository.findByProductID(product.getProductID()).isEmpty())
		product.setProductID(productRepository.findTop1ByOrderByProductIDDesc().get().getProductID() + 1);
		
		productRepository.save(product);
		
		Optional<Product> prod = productRepository.findByProductIDAndColorCodeAndSize(product.getProductID(),
				product.getColorCode(),product.getSize());
		if (product.getMultipartFile1().isEmpty())
			prod.get().setProductImgDir1("/blankShop/img/product/noimage.jpg");
		else {
			String ImgPath = fileUploadUtils.FileUpload(product.getMultipartFile1(), prod.get().getTypeId(), 1);
			prod.get().setProductImgDir1(ImgPath);
		}
		if (product.getMultipartFile2().isEmpty())
			prod.get().setProductImgDir2("/blankShop/img/product/noimage.jpg");
		else {
			String ImgPath2 = fileUploadUtils.FileUpload(product.getMultipartFile2(), prod.get().getTypeId(), 2);
			prod.get().setProductImgDir2(ImgPath2);
		}
		if (product.getMultipartFile3().isEmpty())
			prod.get().setProductImgDir3("/blankShop/img/product/noimage.jpg");
		else {
			String ImgPath3 = fileUploadUtils.FileUpload(product.getMultipartFile3(), prod.get().getTypeId(), 3);
			prod.get().setProductImgDir3(ImgPath3);
		}
		prod.get().setSalePrice(product.getProductPrice());

		return true;
	}
	public boolean updateStock(Integer id,Integer stockNumber) {
		Optional<Product> product = productRepository.findById(id);
		if(product.isPresent()) {
		product.get().setStockNumber(stockNumber);
		
		return true;
		}
		return false;	 	
	}
	
	public boolean checkstyle(String colorCode,String productName,String size) {
	
		 Optional<Product> product = productRepository.findByColorCodeAndProductNameAndSize(colorCode, productName,size);
		 if(product.isPresent())
		return false;
		 
		 return true;
		 
		
	}
	
	public List<Product> checkSize(String colorCode,String productName){
		
		return productRepository.findSizeByColorCodeAndProductName(colorCode, productName);
	}
	
	
	public Integer totalProduct() {
		return productRepository.gettotalProduct();
	}

	public List<Product> Allproducts(){
		return productRepository.findAll();
	}
	
	public  List<ProductSales> showProductChart(){
		List<ProductSales> productChart = new ArrayList<ProductSales>();
		
		productRepository.findAll();
		
		
		
		ProductSales productSales = new ProductSales();
		
		
		
		
		
		return productChart;
		
	}
	
	
	
	
	
}
