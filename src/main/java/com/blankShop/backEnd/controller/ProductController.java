package com.blankShop.backEnd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blankShop.backEnd.dto.ProductSales;
import com.blankShop.backEnd.model.productTotal;
import com.blankShop.backEnd.service.ProductService;
import com.blankShop.model.Product;

@Controller
@RequestMapping("/backEnd")
public class ProductController {
	@Autowired
	ProductService service;

	// 商品視圖層
	@GetMapping("/viewProduct")
	public String viewProduct() {
		return "productView";
	}

	@GetMapping("/viewProductInMarket")
	public String productDown() {
		return "productInMarket";
	}

	@GetMapping("/viewProductNotification")
	public String ProductNotification() {
		return "productNotification";
	}

	// 檢視上架商品
	@GetMapping("/product")
	@ResponseBody
	public List<Product> getAllProduct() {
		return service.products();
	}

	// 檢視下架商品
	@GetMapping("/productdown")
	@ResponseBody
	public List<Product> getAllProductdown() {
		return service.productdown();
	}

	// 檢視警告商品
	@GetMapping("/productNotification")
	@ResponseBody
	public List<Product> getStockNotification() {
		return service.stocknotification();
	}

	// 選取單一商品
	@GetMapping("/product/{id}")
	@ResponseBody
	public Product getProductById(@PathVariable Integer id) {

		return service.findById(id);
	}

	// 新增單一商品
	@PostMapping("/product")
	@ResponseBody
	public Map<String, String> insert(Product formData) throws IOException {
		Map<String, String> msg = new HashMap<>();
		boolean status = service.insert(formData);

		if (status)
			msg.put("msg", "新增成功!");
		else
			msg.put("msg", "新增失敗!");

		return msg;
	}

	// 更新單一商品
	@PutMapping("/product/{id}")
	@ResponseBody
	public Map<String, String> updateProductBtId(@PathVariable Integer id, Product product) throws IOException {
		Map<String, String> msg = new HashMap<>();
		boolean status = service.update(id, product);

		if (status)
			msg.put("msg", "型別編號:" + id + "更改成功!");
		else
			msg.put("msg", "型別編號:" + id + "更改失敗!");
		return msg;

	}

	// 下架商品
	@DeleteMapping("/product/{id}")
	@ResponseBody
	public Map<String, String> deleteById(@PathVariable Integer id) {
		Map<String, String> msg = new HashMap<>();
		boolean status = service.StatusDown(id);

		if (status)
			msg.put("msg", "型別編號:" + id + "下架成功!");
		else
			msg.put("msg", "型別編號:" + id + "下架失敗!");
		return msg;
	}

	// 上架商品
	@PutMapping("/productup/{id}")
	@ResponseBody
	public Map<String, String> startSale(@PathVariable Integer id) {
		Map<String, String> msg = new HashMap<>();
		boolean status = service.StatusUp(id);

		if (status)
			msg.put("msg", "型別編號:" + id + "上架成功!");
		else
			msg.put("msg", "型別編號:" + id + "上架失敗!");
		return msg;
	}

	// 更新庫存
	@PutMapping("/productstock/{id}")
	@ResponseBody
	public Map<String, String> updateStock(@PathVariable Integer id, Integer stockNumber) throws IOException {
		Map<String, String> msg = new HashMap<>();
		boolean status = service.updateStock(id, stockNumber);

		if (status)
			msg.put("msg", "型別編號:" + id + "更改成功!");
		else
			msg.put("msg", "型別編號:" + id + "更改失敗!");
		return msg;

	}

	// 檢查是否重複樣式
	@GetMapping("/product/checkstyle")
	@ResponseBody
	public Map<String, String> checkstyle(String colorCode, String productName, String size) {
		Map<String, String> msg = new HashMap<>();

		boolean status = service.checkstyle(colorCode, productName, size);
		if (status)
			msg.put("msg", "1");
		else
			msg.put("msg", "2");

		return msg;

	}

	// 調整大小的BOX
	@GetMapping("/product/checkSize")
	@ResponseBody
	public List<String> checkSize(String colorCode, String productName) {
		System.out.println(productName);
		List<Product> products = service.checkSize(colorCode, productName);
		List<String> sizes = new ArrayList<String>();
		for (int i = 0; i < products.size(); i++) {
			sizes.add(products.get(i).getSize());
		}

		return sizes;

	}

	// 首頁顯示每日訂單累積金額
	@GetMapping("/product/getproductamount")
	@ResponseBody
	public Integer getTotalProduct(productTotal pdt) {
		Integer totalproduct = service.totalProduct();
		if (totalproduct != null) {
			pdt.setProductTotal(totalproduct);
		} else {
			pdt.setProductTotal(0);
		}
		return pdt.getProductTotal();
	}

	//
	@GetMapping("/product/chart")
	@ResponseBody
	public List<ProductSales> showProductChart() {

		return service.showProductChart();
	}

}
