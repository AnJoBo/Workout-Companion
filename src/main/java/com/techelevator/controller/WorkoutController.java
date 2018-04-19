package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.CheckInAndOutDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;
import com.techelevator.model.WorkoutDAO;
import com.techelevator.model.WorkoutUserJoinDAO;
import com.techelevator.model.WorkoutUserJoined;
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
	private WorkoutUserJoinDAO workoutUserJoinDAO;
	
	@Autowired
	public WorkoutController(UserDAO userDAO, CheckInAndOutDAO checkInDAO, WorkoutDAO workoutDAO, WorkoutUserJoinDAO workoutUserJoinDAO) {
		this.userDAO = userDAO;
	    this.checkInDAO = checkInDAO;
	    this.workoutDAO = workoutDAO;
	    this.workoutUserJoinDAO = workoutUserJoinDAO;
	}
	
	@RequestMapping(path="/users/workout", method = RequestMethod.GET)
	public String displayWorkoutsPage(ModelMap mh, HttpSession session) {
		int currentUserId = ((User)session.getAttribute("currentUser")).getUserId();
		
		List<WorkoutUserJoined> getSetsAndReps = workoutUserJoinDAO.getNumberOfSetsAndRepsFromUserId(currentUserId);
		mh.put("getSetsAndReps", getSetsAndReps);

		//mh.put("workouts", workouts);
		return "displayWorkout";
	}

	
	
	@RequestMapping(path="/users/workout", method = RequestMethod.POST)
	public String displayWorkoutsPost(ModelMap mh,
			@RequestParam int workoutId,
			@RequestParam int sets,
			@RequestParam int currentUserId,
			@RequestParam int weight,
			@RequestParam int equipment,
			@RequestParam int reps1,
			@RequestParam(defaultValue="0") int reps2,
			@RequestParam(defaultValue="0") int reps3,
			@RequestParam(defaultValue="0") int reps4,
			@RequestParam(defaultValue="0") int reps5,
			@RequestParam(defaultValue="0") int reps6,
			@RequestParam(defaultValue="0") int reps7,
			@RequestParam(defaultValue="0") int reps8,
			HttpSession session) {
		//List<Workouts> workouts = workoutDAO.getAllWorkouts();
		
		//mh.put("workouts", workouts);
		workoutUserJoinDAO.saveWorkout(reps1,reps2,reps3,reps4, reps5, reps6, reps7, reps8, sets, weight, workoutId, currentUserId, equipment);

		
		return "redirect:/users/workout";
	}
	
	@RequestMapping(path="/users/exercises", method = RequestMethod.GET)
		public String displayExercisesPage(ModelMap mh) {
			List<Workouts> exercises = workoutDAO.getAllWorkouts();
			mh.put("allExercises", exercises);
			return "exerciseGuide";
		}
	}
	

