package com.blankShop.frontEnd.model;

import java.util.Comparator;

import com.blankShop.model.Product;

public class priceComparator implements Comparator<Product>{
	
	public int compare(Product p1, Product p2) {
		
		if (p1.getSalePrice()==0) {
			p1.setSalePrice(p1.getProductPrice());
		}
		
		if (p2.getSalePrice()==0) {
			p2.setSalePrice(p2.getProductPrice());
		}
		
		if (p1.getSalePrice()>p2.getSalePrice()) {
			return 1;
		}
		else if(p1.getSalePrice()<p2.getSalePrice()) {
			return -1;
		}
		else {
			return 0;
		}
	}

}
