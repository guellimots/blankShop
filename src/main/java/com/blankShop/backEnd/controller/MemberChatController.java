package com.blankShop.backEnd.controller;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blankShop.backEnd.service.employeeService;


@Controller
@RequestMapping("/backEnd")
public class MemberChatController {
	
	@Autowired
	employeeService empService;
	
	@GetMapping("/adminChatRoomView")
	public String ChatRoom() {
		return "adminChatRoomView";
	}
	

	@GetMapping("/adminChatRoom")
	public String AdminChatRoom() {
		return "adminChatRoom";
	}
	
	
	@GetMapping("/employeePhoto/{username}")
	public ResponseEntity<byte[]> getempphoto(@PathVariable String username){
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_JPEG);
	    byte[] img = empService.findByphoto(username);
	    System.out.println("img:"+ Base64.encodeBase64(img));
	    return new ResponseEntity<>(Base64.encodeBase64(img), headers, HttpStatus.OK);
	}
}
