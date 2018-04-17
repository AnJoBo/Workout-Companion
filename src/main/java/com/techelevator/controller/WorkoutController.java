package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.CheckInAndOutDAO;
import com.techelevator.model.UserDAO;
import com.techelevator.model.WorkoutDAO;
import com.techelevator.model.Workouts;

@Controller
public class WorkoutController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CheckInAndOutDAO checkInDAO;
	@Autowired
	private WorkoutDAO workoutDAO;

	@Autowired
	public WorkoutController(UserDAO userDAO, CheckInAndOutDAO checkInDAO, WorkoutDAO workoutDAO) {
		this.userDAO = userDAO;
	    this.checkInDAO = checkInDAO;
	    this.workoutDAO = workoutDAO;
	}
	
	@RequestMapping(path="/users/workout", method = RequestMethod.GET)
	public String displayWorkoutsPage(ModelMap mh, int reps[]) {
		List<Workouts> workoutList = workoutDAO.getAllWorkouts();
		mh.put("allWorkouts", workoutList);
		
		return "displayWorkout";
	}
	
	@RequestMapping(path="/users/workout", method = RequestMethod.POST)
	public String displayWorkoutsPost(ModelMap mh, int reps[]) {
		List<Workouts> workoutList = workoutDAO.getAllWorkouts();
		mh.put("allWorkouts", workoutList);
		
		return "redirect:/users/workout";
	}
	
}
