package com.techelevator.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path = "/users/new", method = RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if (!modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}

	@RequestMapping(path = "/users", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if (result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/users/new";
		}
		userDAO.saveUser(user.getUserName(), user.getPassword(), user.getRole(), user.getEmail(), user.getPhone(), user.getPicture(), user.getFitnessGoal());
		return "redirect:/";
	}

	@RequestMapping(path = "/users/{userName}", method = RequestMethod.GET)
	public String displayUserPage(ModelMap modelHolder, HttpSession session) {

		return "userPage";
	}
	
	// Login Page link function****************
	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String displayLoginPage(ModelMap modelHolder, HttpSession session) {

		return "login";
	}
	
	@RequestMapping(path = "/about", method = RequestMethod.GET)
	public String displayAboutPage(ModelMap modelHolder, HttpSession session) {

		return "about";
	}
	

	@RequestMapping(path = "/userUpdate/{userName}", method = RequestMethod.GET)
	public String displayUserUpdatePage() {
		return "userUpdate";
	}

	@RequestMapping(path = "/userUpdate/{userName}", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String userName, @RequestParam String password,
			RedirectAttributes flash) {
		flash.addFlashAttribute("message", "success");
		userDAO.updatePassword(userName, password);
		return "redirect:/users/userPage";
	}

	public String userUpdatePage(@RequestParam String userName, @RequestParam String password,
			RedirectAttributes flash) {
		flash.addFlashAttribute("message", "Success!");
		userDAO.updatePassword(userName, password);
		return "redirect:/users/userPage";
	}

	// check in check out stuff ......
	@RequestMapping(path = "/gymCheckInAndOut/{userName}", method = RequestMethod.GET)
	public String displayloginAndOutPage(ModelMap modelHolder, HttpSession session) {
		
		return "gymCheckInAndOut";
	}
// need a post for a user to push a button and tell the database to add a begin date, or check to see if it already is there
	@RequestMapping(path = "/gymCheckInAndOut/{userName}", method = RequestMethod.POST)
	public String showParkDetailsCelc(@RequestParam String userName, HttpSession session,
			@RequestParam boolean checkIn,  ModelMap modelHolder) {
		 LocalDate a = LocalDate.now();
		 a.getDayOfWeek().toString();
		userDAO.saveUserCheckInAtGym(userName, a);
//		Boolean isChecked = true;
//		if (checkIn == true) {
//			isChecked = true; 
//		} else {
//			isChecked = false;
//		}

		
//		modelHolder.put("parkCode", parkCode);
		//session.setAttribute("isChecked", isChecked);

	
	return"redirect:/gymCheckInAndOut";
} 
	
	// end of check in stuff
	
	@RequestMapping(path = "/homepage/{userName}", method = RequestMethod.GET)
	public String displayTestHomePage(ModelMap modelHolder, HttpSession session) {

		return "homepage";
	}
}