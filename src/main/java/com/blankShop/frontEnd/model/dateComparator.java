package com.blankShop.frontEnd.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

import com.blankShop.model.Product;

public class dateComparator implements Comparator<Product>{
	
	public int compare(Product p1, Product p2) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date1=null;
		Date date2=null;

		try {
		      date1 = format.parse(p1.getInMarketDate());
			  date2 = format.parse(p2.getInMarketDate());
		}
		catch(ParseException e) {
			
		}
		
		if (date1.compareTo(date2)<0) {
			return 1;
		}
		else if (date1.compareTo(date2)>0){
			return -1;
		}
		else {
			return 0;
		}
		
			
	}

}
