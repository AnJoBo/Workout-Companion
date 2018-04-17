package com.techelevator.model;

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
		JoinedData.setReps(user.getInt("reps"));
		JoinedData.setNumberOfSets(user.getInt("number_of_sets"));
		JoinedData.setWeight(user.getInt("weight"));
		JoinedData.setWorkoutid(user.getInt("workout_id"));
		JoinedData.setUserid(user.getInt("user_id"));
		JoinedData.setEquipmentid(user.getInt("equipment_id"));
		return JoinedData;
	}

	
	
	
}