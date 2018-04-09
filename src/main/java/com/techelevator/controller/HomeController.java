package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
//	private UserDAO userDAO;
//
//	@Autowired
//	public HomeController(UserDAO userDAO) {
//		this.userDAO = userDAO;
//	}
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showHomePage() {
		
		return "home";

	}
}