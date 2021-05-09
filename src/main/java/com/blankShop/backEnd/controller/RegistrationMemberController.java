package com.blankShop.backEnd.controller;


import java.util.Set;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.blankShop.backEnd.dto.UserStorage;

@RestController
@CrossOrigin
public class RegistrationMemberController {

	@GetMapping("/registration/{userName}")
	public void register(@PathVariable String userName) {
		System.out.println("handling register user request: " + userName);	
			try {
				UserStorage.getInstance().setUser(userName);

			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
	}

	@GetMapping("/fetchAllUsers")
	public Set<String> fetchAll() {
		return UserStorage.getInstance().getUsers();
	}
}
