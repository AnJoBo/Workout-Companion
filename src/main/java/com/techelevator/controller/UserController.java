package com.techelevator.controller;

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
	public String displayUserDashboard(ModelMap modelHolder, HttpSession session) {

		return "userDashboard";
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
	public String updateAccount(@RequestParam String userName,
								@RequestParam(required=false) String newUserName,
								@RequestParam(required=false) String newEmail,
								@RequestParam(required=false) String newPhone,
								@RequestParam(required=false) String newPicture,
								@RequestParam(required=false) String newFitnessGoal,
								RedirectAttributes flash,
								HttpSession session) {
		
		User thisUser = new User();
		thisUser = userDAO.getUserByUserName(userName);
		
		if(newUserName.equals("")) {
			newUserName = thisUser.getUserName();
		}
		if(newEmail.equals("")) {
			newEmail = thisUser.getEmail();
		}
		if(newPhone.equals("")) {
			newPhone = thisUser.getPhone();
		}
		//if(newPicture.equals("")) {
			newPicture = thisUser.getPicture();
		//}
		if(newFitnessGoal.equals("")) {
			newFitnessGoal = thisUser.getFitnessGoal();
		}
		
		flash.addFlashAttribute("message", "Your information has been updated!");
		userDAO.updateUser(userName, newUserName, newEmail, newPhone, newPicture, newFitnessGoal);
		session.setAttribute("currentUser", userDAO.getUserByUserName(newUserName));
		return "redirect:/users/userDashboard";
	}

	// check in check out stuff ......
	@RequestMapping(path = "/gymCheckInAndOut/{userName}", method = RequestMethod.GET)
	public String displayloginAndOutPage(ModelMap modelHolder, HttpSession session) {

		return "gymCheckInAndOut";
	}
// need a post for a user to push a button and tell the database to add a begin date, or check to see if it already is there
	@RequestMapping(path = "/gymCheckInAndOut/{userName}", method = RequestMethod.POST)
	public String showParkDetailsCelc(HttpSession session,
			@RequestParam boolean checkIn,  ModelMap modelHolder) {
		Boolean isChecked = true;
		if (checkIn == true) {
			isChecked = true; 
		} else {
			isChecked = false;
		}

//		modelHolder.put("parkCode", parkCode);
		session.setAttribute("isChecked", isChecked);

	
	return"redirect:/gymCheckInAndOut";
} 
	
	// end of check in stuff

	@RequestMapping(path="/employee/dashboard", method= RequestMethod.GET)
	public String displayEmployeeDashboard(ModelMap modelHolder, HttpSession session) {
return "employeeDashboard"	;
	}
}