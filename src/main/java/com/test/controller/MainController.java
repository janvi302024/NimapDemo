package com.test.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {

	@GetMapping("/alltest")
	public String Test()
	{
		return new String("Project Tested Successfully!!!");     
	}		
}
