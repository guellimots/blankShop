package com.blankShop.backEnd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blankShop.backEnd.model.Member01;
import com.blankShop.backEnd.model.Order;
import com.blankShop.backEnd.service.MemberService;
import com.blankShop.backEnd.service.orderService;
import com.blankShop.backEnd.model.MemAge;

@Controller
@RequestMapping("/mem")
public class MemberController {


	@Autowired
	MemberService memberService;
	
	@Autowired
	orderService orderservice;

	@Autowired
	ServletContext context;

	// 顯示所有會員資
	@GetMapping("/showAllMembers")
	@ResponseBody
	public List<Member01> list(Model model) {
		List<Member01> employees=memberService.getAllMember();
		return employees;
	}

	@GetMapping("/editMem")
	public String editMem(String msg,Model m) {
		m.addAttribute("msg",msg);
		return "editMem";
	}
	
	@GetMapping("/memByAge")
	public String memByAge() {
		return "memByAge";
	}
	
	

	// 模糊查詢
	@GetMapping(value = "/like")
	@ResponseBody
	public List<Member01> showSearch(@RequestParam(value = "name") String memberName, Model model) {
		List<Member01> list = memberService.searchMems(memberName);
		return list;
	}

	@GetMapping(value = "/updateMem/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("strbase64", "image/avatar.png");
		Member01 member01 = memberService.get(id);
		if (member01.getProfileImg() != null) {
			byte[] base64 = Base64Utils.encode(member01.getProfileImg());
			String strbase64 = new String(base64);
			model.addAttribute("strbase64", "data:image/png;base64," + strbase64);
		}
		model.addAttribute(member01);
		return "updateMember";
	}

	@PostMapping("/updateMem/{id}")
	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	//
	public String modify(@RequestParam(value = "address") String address ,@RequestParam(value = "cellNumber") String cellNumber,@ModelAttribute("member") Member01 member, BindingResult result, Model model,
			@PathVariable Integer id, HttpServletRequest request) {
			Member01 member01=memberService.get(id);
					member01.setAddress(address);
					member01.setCellNumber(cellNumber);

		memberService.update(member01);
		return "redirect:/mem/editMem?msg=success";
		
	}
	
	
	
	//把會員跟年齡還有總消費金額回傳給前台
	@GetMapping(value = "/memberByPrice")	
	@ResponseBody
	public  List<MemAge> sortMember(){
//		Map<Integer, Integer> sorted = new HashMap<>();
		List<Order> order = orderservice.findAll() ;
		List<Member01> allMem=memberService.getAllMember();
		List<MemAge> memSpent=new ArrayList<MemAge>();
		//會員的數量
		Integer count=allMem.size();
		Integer countOrder=order.size();
		
//		ArrayList<Integer> Mems=new ArrayList<Integer>(count);
		Integer[] Mems=new Integer[count];
		Integer[] Age=new Integer[count];
		String[] Name=new String[count];
		Integer[] Total=new Integer[count];
		Integer[][] MemTotal=new Integer[count][4];
		//取得今天日期  轉成字串  取前四位再轉成int
		Date now = new Date();
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String str = bartDateFormat.format(now);
		Integer thisYear=Integer.parseInt(str.substring(0,4));
		
		Integer money=0;
//		把total  所有會員消費金額初始化為0
		for(int k=0;k<count; k++) {
			Total[k]=0;
		}
		
		//找出order的所有的memberId還有
		for(int i=0;i<count; i++) {
			Mems[i]=allMem.get(i).getMemberId();
			Name[i]=allMem.get(i).getMemberName();
			String Bd=String.valueOf(allMem.get(i).getBirthday());
			Integer BirthYear=Integer.parseInt(Bd.substring(0,4));
			Age[i]=thisYear-BirthYear;
								
		}
		//找出oder裡面對應的memberid的price加總
		for(int i=0;i<countOrder; i++) {
		
			for(int j=0;j<count; j++) {
				Integer tempOrder=order.get(i).getMemberId();
				Integer tempMem=Mems[j];
				System.out.println("tempOrder:"+tempOrder);
				System.out.println("tempMem  :"+tempMem);
				
				
			  if(tempOrder.equals(tempMem)) {
//				
   			    money=order.get(i).getPrice();
   			    Total[j]=Total[j]+money;
   			    
			  }else money=0;
//			System.out.println("order.get(i).getPrice()"+order.get(i).getPrice()); 
			}			
		}

		for(int m=0;m<count;m++) {
				MemTotal[m][0]=Mems[m];
				MemTotal[m][1]=Total[m];
				MemTotal[m][2]=Age[m];
				
				//總消費超過4000等級1,2000-4000等級2,以下等級3
				if(MemTotal[m][1]>=4000)
					MemTotal[m][3]=1;
				else if(MemTotal[m][1]>2000){
				   MemTotal[m][3]=2;}
				else {MemTotal[m][3]=3;}
								
		}
		
		System.out.println("MemTotal[1]"+MemTotal[1]);	
		for(int i = 0 ;i<MemTotal.length;i++) {
			MemAge memAge  = new MemAge();
			memAge.setMemberId(MemTotal[i][0]);
			memAge.setLevel(MemTotal[i][3]);
			memAge.setSpending(MemTotal[i][1]);
			memAge.setAge(MemTotal[i][2]);
			memAge.setMemberName(Name[i]);
			memSpent.add(memAge);		}
		return memSpent;
		
	}
	//把會員跟年齡還有總消費金額回傳給前台
	@PostMapping(value = "/sortMemAge")	
	@ResponseBody
	public  List<MemAge> sortMemAge(){
		List<Order> order = orderservice.findAll() ;
		List<Member01> allMem=memberService.getAllMember();
		List<MemAge> sortMemAge=new ArrayList<MemAge>();
		//會員的數量
		Integer count=allMem.size();
		Integer countOrder=order.size();
		
//		ArrayList<Integer> Mems=new ArrayList<Integer>(count);
		Integer[] Mems=new Integer[count];
		Integer[] Age=new Integer[count];
		String[] Name=new String[count];
		Integer[] Total=new Integer[count];
		Integer[][] MemTotal=new Integer[count][4];
		//取得今天日期  轉成字串  取前四位再轉成int
		Date now = new Date();
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String str = bartDateFormat.format(now);
		Integer thisYear=Integer.parseInt(str.substring(0,4));
		
		Integer money=0;
//		把total  所有會員消費金額初始化為0
		for(int k=0;k<count; k++) {
			Total[k]=0;
		}
		
		//找出order的所有的memberId還有
		for(int i=0;i<count; i++) {
			Mems[i]=allMem.get(i).getMemberId();
			Name[i]=allMem.get(i).getMemberName();
			
			String Bd=String.valueOf(allMem.get(i).getBirthday());
			System.out.println(Bd);
			Integer BirthYear=Integer.parseInt(Bd.substring(0,4));
			Age[i]=thisYear-BirthYear;
								
		}

		
		//找出oder裡面對應的memberid的price加總
		for(int i=0;i<countOrder; i++) {
		
			for(int j=0;j<count; j++) {
				Integer tempOrder=order.get(i).getMemberId();
				Integer tempMem=Mems[j];
//				System.out.println("tempOrder:"+tempOrder);
//				System.out.println("tempMem  :"+tempMem);
				
				
			  if(tempOrder.equals(tempMem)) {
//				
   			    money=order.get(i).getPrice();
   			    Total[j]=Total[j]+money;
   			    
			  }else money=0;
//			System.out.println("order.get(i).getPrice()"+order.get(i).getPrice()); 
			}			
		}

		for(int m=0;m<count;m++) {
				MemTotal[m][0]=Mems[m];
				MemTotal[m][1]=Total[m];
				MemTotal[m][2]=Age[m];
				
				//總消費超過4000等級1,2000-4000等級2,以下等級3
				if(MemTotal[m][1]>=4000)
					MemTotal[m][3]=1;
				else if(MemTotal[m][1]>2000){
				   MemTotal[m][3]=2;}
				else {MemTotal[m][3]=3;}
								
		}
		//依照年紀排序
		
		for(int k=0;k<count;k++) {
			for(int j=0; j<count-1;j++) {
				Integer temp=Age[j];
				Integer tempMem=Mems[j];
				String tempName=Name[j];
				Integer tempTot=Total[j];
				Integer tempLev=MemTotal[j][3];
				if(Age[j+1]<Age[j]) {
					Age[j]=Age[j+1];
					Mems[j]=Mems[j+1];
					Name[j]=Name[j+1];
					Total[j]=Total[j+1];
					MemTotal[j][3]=MemTotal[j+1][3];
					Age[j+1]=temp;
					Mems[j+1]=tempMem;
					Name[j+1]=tempName;
					Total[j+1]=tempTot;
					MemTotal[j+1][3]=tempLev;	
				}
			}	
		}
		
		System.out.println("MemTotal[1]"+MemTotal[1]);	
		for(int i = 0 ;i<MemTotal.length;i++) {
			MemAge memAge  = new MemAge();
			memAge.setMemberId(Mems[i]);
			memAge.setLevel(MemTotal[i][3]);
			memAge.setSpending(Total[i]);
			memAge.setAge(Age[i]);
			memAge.setMemberName(Name[i]);
			sortMemAge.add(memAge);		}
		return sortMemAge;	
	}	

}
