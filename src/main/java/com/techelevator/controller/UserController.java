package com.techelevator.controller;

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

import com.techelevator.model.CheckInAndOutDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CheckInAndOutDAO checkInDAO;

	@Autowired
	public UserController(UserDAO userDAO, CheckInAndOutDAO checkInDAO) {
		this.userDAO = userDAO;
	    this.checkInDAO = checkInDAO;
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
			flash.addFlashAttribute("message", "Please try again. (With a stronger password, perhaps?)");
			return "redirect:/users/new";
		}
		userDAO.saveUser(user.getUserName(), user.getPassword(), user.getRole(), user.getEmail(), user.getPhone(),
				user.getPicture(), user.getFitnessGoal());
		flash.addFlashAttribute("message", "User sucessfully created!");
		return "redirect:/";
	}

	@RequestMapping(path = "/users/{userName}", method = RequestMethod.GET)
	public String displayUserDashboard(ModelMap modelHolder, HttpSession session, @PathVariable String userName) {	
		boolean checkUserCheckInStatus = checkInDAO.checkIfUserIsCheckedIn(userName);
		if(checkUserCheckInStatus) {
			modelHolder.put("checkedIn", true);
		} else {
			modelHolder.put("checkedIn", false);
		}
		modelHolder.put("timeSpent", checkInDAO.getTotalTimeSpentAtGym(userName));
		return "userDashboard";
	}

	@RequestMapping(path = "/checkIn/{userName}", method = RequestMethod.POST)
	public String checkInUser(@PathVariable String userName, @RequestParam int currentUserId, ModelMap modelHolder, HttpSession session) {
		checkInDAO.checkInUser(currentUserId);
		return "redirect:/users/" + userName;
	}
	
	@RequestMapping(path = "/checkOut/{userName}", method = RequestMethod.POST)
	public String checkOutUser(@PathVariable String userName, @RequestParam int currentUserId, ModelMap modelHolder, HttpSession session) {
		checkInDAO.checkOutUser(currentUserId);
		return "redirect:/users/" + userName;
	}

	@RequestMapping(path = "/userUpdate/{userName}", method = RequestMethod.GET)
	public String displayUserUpdatePage() {
		return "userUpdate";
	}

	@RequestMapping(path = "/userUpdate/info", method = RequestMethod.POST)
	public String updateAccount(@RequestParam String userName, @RequestParam(required = false) String newUserName,
								@RequestParam(required = false) String newEmail, @RequestParam(required = false) String newPhone,
								@RequestParam(required = false) String newPicture, @RequestParam(required = false) String newFitnessGoal,
								@RequestParam(required = true) String password,
								RedirectAttributes flash, HttpSession session) {

		User thisUser = new User();
		thisUser = userDAO.getUserByUserName(userName);

		if (newUserName.equals("")) {
			newUserName = thisUser.getUserName();
		}
		if (newEmail.equals("")) {
			newEmail = thisUser.getEmail();
		}
		if (newPhone.equals("")) {
			newPhone = thisUser.getPhone();
		}
		
		newPicture = thisUser.getPicture();
		
		if (newFitnessGoal.equals("")) {
			newFitnessGoal = thisUser.getFitnessGoal();
		}

		flash.addFlashAttribute("message", "Your information has been updated!");
		userDAO.updateUser(userName, newUserName, newEmail, newPhone, newPicture, newFitnessGoal, password);
		session.setAttribute("currentUser", userDAO.getUserByUserName(newUserName));
		return "redirect:/users/userDashboard";
	}
	
 	@RequestMapping(path = "/userUpdate/password", method = RequestMethod.POST)
 	public String updatePassword(@RequestParam String userName, @RequestParam String password, @RequestParam String newPassword, RedirectAttributes flash) {
 		flash.addFlashAttribute("message", "Your password has been successfully changed!");
 		userDAO.updatePassword(userName, password, newPassword);
 		return "redirect:/users/userPage";
 	}

	@RequestMapping(path = "/deleteUser/{userName}", method = RequestMethod.POST)
	public String deleteUser(@RequestParam String userName, ModelMap modelHolder, HttpSession session) {
		userDAO.deleteUser(userName);
		modelHolder.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(path = "/employee/dashboard", method = RequestMethod.GET)
	public String displayEmployeeDashboard(ModelMap mh, HttpSession session) {
		mh.put("allUsers", userDAO.getAllUsers());
		return "employeeDashboard";
	}
	
	@RequestMapping(path = "/employee/userMetrics/{userName}", method = RequestMethod.GET)
	public String displayUserMetrics(ModelMap mh, HttpSession session, @PathVariable String userName) {
		mh.put("thisUser", userDAO.getUserByUserName(userName));
		mh.put("usersMetrics", userDAO.getAllUserMetricData(userName));
		return "gymMemberMetrics";
	}
}