package com.blankShop.backEnd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blankShop.model.Member;
import com.blankShop.model.Product;
import com.blankShop.model.incomePerday;
import com.blankShop.backEnd.model.CountType;
import com.blankShop.backEnd.model.Order;
import com.blankShop.backEnd.model.OrderDaily;
import com.blankShop.backEnd.service.ProductService;
import com.blankShop.backEnd.service.orderService;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Controller
@RequestMapping("/OrdersInfoMain")
public class OrderController {

	@Autowired
	orderService orderservice;
	
	@Autowired
	ProductService productservice;
	
	Logger logger = LogManager.getLogger(getClass());
	
	@GetMapping("/oerderDetail")
	public String procseeOrdersPage() {
		logger.info("導入訂單管理頁面");
		return "ordersMain";
	}
	
	//顯示所有訂單
	@GetMapping("/getorders")
	@ResponseBody
	public List<Order> getAllOrderInfo(){
		logger.info("查詢所有訂單資訊");
		return orderservice.findAll();
	}
	
	//更新訂單狀態
	@PutMapping("/updateorders")
	@ResponseBody
	public Order processUpdateOrder(Order orders) {
		logger.info("開始執行更新controller");
		try {
			logger.debug("開始更新");
			orderservice.updateorders(orders);
		}catch(Exception e) {
			logger.error("訂單更新發生錯誤:",e);
		}
		return orders;
	}
	
	//取得個別訂單資料
	@GetMapping("/getordersId/{orderIdentity}")
	@ResponseBody
	public Order getOrderInfoId(@PathVariable Integer orderIdentity){	
		return orderservice.findorderid(orderIdentity);
	}
	
	//取得會員相關資料
	@GetMapping("/getordememberId/{memberId}")
	@ResponseBody
	public Member getOrderMemberId(@PathVariable Integer memberId) {
		return orderservice.findMemberId(memberId);
	}
	
	//取得產品相關資訊
	@GetMapping("/getordproductId/{productId}")
	@ResponseBody
	public Product getProductId(@PathVariable Integer productId) {
		return productservice.findById(productId);
	}
	
	//首頁顯示每日訂單累積金額
	@GetMapping("/getordDaytotalPrice")
	@ResponseBody
	public Integer getDayTotalPrice(OrderDaily od) {
		Integer totalprice = orderservice.findtodaytotalPrice();
		if(totalprice != null) {
			od.setToDaytotalPrice(totalprice);
		}else {
			od.setToDaytotalPrice(0);
		}		
		return od.getToDaytotalPrice();
	}
	
	//首頁顯示每日訂單數量
	@GetMapping("/getordDaytotalOrder")
	@ResponseBody
	public Integer getDayTotalorder(OrderDaily od) {
		Integer totalorder = orderservice.findtodaytotalorder();
		if(totalorder != null) {
			od.setToDaytotalOrder(totalorder);
		}else {
			od.setToDaytotalOrder(0);
		}		
		return od.getToDaytotalOrder();
	}
	
	// 把四種衣服種類的銷售數據跟銷售金額傳到前台的chart分析圖
		@PostMapping(value = "/typeAmount")
		@ResponseBody
		public List<CountType> typeAmount() {
			List<Product> prod = productservice.Allproducts();
			List<CountType> fourType = new ArrayList<CountType>();

			Integer count = prod.size();

			String typeFour[] = { "上衣", "襯衫", "褲裝", "裙裝" };
			Integer mountFour[] = { 0, 0, 0, 0 };
			Integer moneyFour[] = { 0, 0, 0, 0 };

			// 把四種衣服分類的賣出數量 總銷售金額 放進array
			for (int i = 0; i < count; i++) {
				String gen = prod.get(i).getGenre();
				Integer mot = prod.get(i).getSoldNumber();
				Integer mone = prod.get(i).getSalePrice();
				if (gen.equals(typeFour[0])) {
					mountFour[0] += mot;
					moneyFour[0] += (mot * mone);
				} else if (gen.equals(typeFour[1])) {
					mountFour[1] += mot;
					moneyFour[1] += (mot * mone);
				} else if (gen.equals(typeFour[2])) {
					mountFour[2] += mot;
					moneyFour[2] += (mot * mone);
				} else if (gen.equals(typeFour[3])) {
					mountFour[3] += mot;
					moneyFour[3] += (mot * mone);
				}

			}

			for (int k = 0; k < 4; k++) {
				CountType countType = new CountType();
				countType.setGenre(typeFour[k]);
				countType.setAmount(mountFour[k]);
				countType.setSalePrice(moneyFour[k]);
				fourType.add(countType);
			}
			return fourType;
		}

		// 抓近七天的每日銷售額,傳送到前台的chart04.js
		@PostMapping(value = "/incomeWeek")
		@ResponseBody
		public List<incomePerday> incomeWeek() throws ParseException {

			List<incomePerday> seven=new ArrayList<incomePerday>();

			// 取得今天日期 轉成字串 
			Date now = new Date();
			//new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        SimpleDateFormat completeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			String day1 = bartDateFormat.format(now);
			String day01=completeFormat.format(now);
			System.out.println("day1="+day1+" type: "+day1.getClass().getName());
			
			//獲得過去前6天的日期  day7是六天前包含今天為7天  day2是昨天
			 Calendar calendar = Calendar.getInstance();
		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 6);
		        Date today = calendar.getTime();
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        String day7 = format.format(today);
		        String day07=day7+" 00:00:00.000";
		        System.out.println("day7="+day7+" type: "+day7.getClass().getName());
		        

		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		        Date today_6 = calendar.getTime();
		        String day6=format.format(today_6);	     
		        
		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		        Date today_5 = calendar.getTime();
		        String day5=format.format(today_5);
		        
		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		        Date today_4 = calendar.getTime();
		        String day4=format.format(today_4);
		        
		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		        Date today_3 = calendar.getTime();
		        String day3=format.format(today_3);
		        
		        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		        Date today_2 = calendar.getTime();
		        String day2=format.format(today_2);
		        
		        
		        
		    String current[]= {day7,day6,day5,day4,day3,day2,day1};
		    Integer moneyPer[]= {0,0,0,0,0,0,0};
	  
			Date date_1 = completeFormat.parse(day01);
			Date date_7 = completeFormat.parse(day07);
			
		    
			List<Order> sevenday=orderservice.latestOrder(date_1,date_7);
			System.out.println("sevenday.size:"+sevenday.size());
			
			Integer mount=sevenday.size();
			System.out.println("mount:"+mount);
			String dates[]=new String[mount];
			Integer money[]=new Integer[mount];
			Integer orderId[]=new Integer[mount];
			
			for(int i=0;i<mount;i++) {
				dates[i]=format.format(sevenday.get(i).getCreateDate());
				money[i]=sevenday.get(i).getPrice();
				orderId[i]=sevenday.get(i).getOrderId();
			
			}
			
			for(int j=0;j<mount;j++) {
				for(int k=0;k<7;k++) {
					if(dates[j].equals(current[k])){
						moneyPer[k]+=money[j];
					}
				}
			}

			for(int i=0;i<7;i++) {
				incomePerday income =new incomePerday();
				income.setDay(current[i]);
				income.setIncome(moneyPer[i]);
				seven.add(income);
				
			}
			return seven;

		}
	
}
