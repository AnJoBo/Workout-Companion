package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.UserDAO;

@Controller
public class AdminController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	public AdminController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/admin/dashboard", method=RequestMethod.GET)
	public String displayAdminDashboard(ModelMap mh) {
		mh.put("allUsers", userDAO.getAllUsers());
		return "adminDashboard";
	}
	
	
}