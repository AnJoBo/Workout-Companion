package com.techelevator.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/users/new";
		}
			
		userDAO.saveUser(user.getUserName(), user.getPassword());
		return "redirect:/";
	}
	
	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
	public String displayUserPage(ModelMap modelHolder, HttpSession session) {
		
		return "userPage";
	}
	
	@RequestMapping(path="/users/{userName}/userUpdate", method=RequestMethod.GET)
	public String displayUserUpdatePage(@ModelAttribute User u, HttpSession session) {
		//Map<String, Object> model, @PathVariable String userName
		//model.put("userName", userName);
		return "userUpdate";
	}
	
//	@RequestMapping(path="/userUpdate", method=RequestMethod.POST)
//	public String userUpdatePage(@ModelAttribute("user") User user,
//								@RequestParam String userName, 
//								@RequestParam String password, 
//								BindingResult result, 
//								RedirectAttributes flash) {
//		if(result.hasErrors()) {
//			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, result);
//			flash.addAttribute("error", "Something went wrong.");
//			
//			return "redirect:/users/{userName}/userUpdate";
//		} else {
//			//flash.addFlashAttribute("user", userName);
//			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, result);
//			flash.addFlashAttribute("message", "Update Password Success.");
//			userDAO.updatePassword(userName, password);
//			
//			return "redirect:/users/{userName}/userPage";
//		}
//	}
	
	@RequestMapping(path="/userUpdate", method=RequestMethod.POST)
	public String userUpdatePage(@ModelAttribute User user, @RequestParam String userName, @RequestParam String password, final RedirectAttributes redirectattributes){
								 
		
		userDAO.updatePassword(userName, password);
		redirectattributes.addFlashAttribute("message", "success");
			return "redirect:/users/{userName}/userPage";
}	
}
