package com.techelevator.model;

import java.util.List;

public interface WorkoutDAO {

	public List<Workouts> getAllWorkouts();

	List<Workouts> getWorkoutFromeWorkoutId(int workoutId);

	

	

	

}
