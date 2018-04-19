package com.techelevator.model;

import java.util.List;

public interface WorkoutUserJoinDAO {

	List<WorkoutUserJoined> getAllJoinedData();

	

	



	List<WorkoutUserJoined> getNumberOfSetsAndRepsFromUserId(int userId);



	void saveWorkout(int reps1, int reps2, int reps3, int reps4, int reps5, int reps6, int reps7, int reps8, int sets,
			int weight, int workoutId, int userId, int equipmentId);



	
}
