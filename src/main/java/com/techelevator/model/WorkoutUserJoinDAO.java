package com.techelevator.model;

import java.util.List;

public interface WorkoutUserJoinDAO {

	List<WorkoutUserJoined> getAllJoinedData();

	void saveWorkout(int reps1, int reps2, int reps3, int reps4, int sets, int weight, int workoutId, int userId, int equipmentId);

	List<WorkoutUserJoined> getNumberOfSetsAndRepsFromUserId(int userId);
	
}
