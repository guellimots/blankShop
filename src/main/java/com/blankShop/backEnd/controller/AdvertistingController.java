package com.blankShop.backEnd.controller;


import java.util.List;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.blankShop.backEnd.service.advertisingService;
import com.blankShop.model.advertising;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Controller
@RequestMapping("/advertisting")
public class AdvertistingController {

	@Autowired
	advertisingService adService;
	
	Logger logger = LogManager.getLogger(getClass());
	
		
	@GetMapping("/Insertadvertisting")
	public String procseeAdvertistingPage() {
		return "AdvertInsert";
	}
	
		
	@GetMapping("/all_advertising")
	public String procseeAdvertPageAll(Model m) {
		return "alladvertising";
	}

	//新增廣告
	@PostMapping("/insertImg")
	public String procseeAdvertistingInsert(@RequestParam("title") String title,
			@RequestParam("imgfile") MultipartFile file, Model m) {
		String result = ""; 
		try {
			byte[] imgByteArr = file.getBytes();
			advertising newImg = new advertising();
			newImg.setTitle(title);
			newImg.setImg(imgByteArr);
			boolean insertResult = adService.save(newImg);
			if (insertResult == true) {
				result = "上傳成功";
			} else {
				result = "上傳失敗";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		m.addAttribute("uploadResult", result);
		return "AdvertInsert";
	}
	
	//顯示所有廣告資料
	@GetMapping("/select_advertisingInfo")
	@ResponseBody
	public List<advertising> getAllAdvertInfo(){
		return adService.findAll();
	}
	
	//尋找個別廣告資料
	@GetMapping("/select_advertisingInfo/{id}")
	@ResponseBody
	public advertising getAdvertInfoId(@PathVariable Integer id){
		return adService.findAdid(id);
	}
	
	//顯示廣告
	@GetMapping("/advertisingImg/{id}")
	public ResponseEntity<byte[]> processgetAdvertistingImg(@PathVariable Integer id){	
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_JPEG);
	    byte[] img = adService.findByImg(id);
	    return new ResponseEntity<>(Base64.encodeBase64(img), headers, HttpStatus.OK);					
	}
	
	//更新廣告狀態
	@PutMapping("/updateadvertisingImg")
	@ResponseBody
	public advertising processUpdateAdvertisting(advertising ad) {
		adService.updateImgDetail(ad);
		return ad;
	}

}
