package com.techelevator.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCWorkoutUserJoinDAO implements WorkoutUserJoinDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWorkoutUserJoinDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<WorkoutUserJoined> getAllJoinedData() {
		List<WorkoutUserJoined> allJoinedData = new ArrayList<>();
		String sqlSelectAll = "SELECT * FROM workout_user";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allJoinedData.add(MapRowToJoined(results));
		}
		return allJoinedData;

}
	private WorkoutUserJoined MapRowToJoined(SqlRowSet user) {
		WorkoutUserJoined JoinedData = null;
		JoinedData = new WorkoutUserJoined();
		JoinedData.setReps1(user.getInt("reps1"));
		JoinedData.setReps2(user.getInt("reps2"));
		JoinedData.setReps3(user.getInt("reps3"));
		JoinedData.setReps4(user.getInt("reps4"));
		JoinedData.setNumberOfSets(user.getInt("number_of_sets"));
		JoinedData.setWeight(user.getInt("weight"));
		JoinedData.setWorkoutid(user.getInt("workout_id"));
		JoinedData.setUserid(user.getInt("user_id"));
		JoinedData.setEquipmentid(user.getInt("equipment_id"));
		JoinedData.setWorkoutDate(user.getString("workout_date"));
		return JoinedData;
	}

	@Override
	public void saveWorkout(int reps1, int reps2, int reps3, int reps4, int sets, int weight, int workoutId, int userId, int equipmentId) {
		

		jdbcTemplate.update("INSERT INTO workout_user(reps1, reps2, reps3, reps4, number_of_sets ,weight ,workout_id, user_id, equipment_id, workout_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", reps1, reps2, reps3, reps4, sets, weight, workoutId, userId, equipmentId, LocalDate.now());
	}
//	@Override
//	public List<WorkoutUserJoined> getNumberOfSetsAndRepsFromUserId(int userId) {
//		List<WorkoutUserJoined> allJoinedData = new ArrayList<>();
//		String sqlSelectAll = "SELECT number_of_sets, reps1, reps2, reps3, reps4 FROM workout_user WHERE user_id = 4";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
//		while (results.next()) {
//			allJoinedData.add(MapRowToJoined(results));
//		}
//		return allJoinedData;
//	}
	
	@Override
	public List<WorkoutUserJoined> getNumberOfSetsAndRepsFromUserId(int userId) {
		String sqlSelect = "SELECT * FROM workout_user WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelect, userId);
		return mapRowSetToSetAndRow(results);
	}
	
	

	
	private List<WorkoutUserJoined> mapRowSetToSetAndRow(SqlRowSet results) {
		ArrayList<WorkoutUserJoined> list = new ArrayList<>();
		while(results.next()) {
			list.add(MapRowToJoined(results));
		}
		return list;
	}
	
	
	
	
	
}