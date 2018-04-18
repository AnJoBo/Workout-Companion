package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCworkoutDAO implements WorkoutDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCworkoutDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	

	
	private Workouts MapRowToEquipment(SqlRowSet user) {
		Workouts equipment = new Workouts();
		equipment.setWorkoutid(user.getInt("workout_id"));
		equipment.setWorkoutname(user.getString("workout_name"));
		equipment.setWorkoutimage(user.getString("workout_image"));
		equipment.setWorkoutdescription(user.getString("workout_description"));
		equipment.setEquipmentid(user.getInt("equipment_id"));
		return equipment;
		
	
	}
	
	
	
	@Override
	public List<Workouts> getAllWorkouts() {
		List<Workouts> allWorkouts = new ArrayList<>();
		String sqlSelectAll = "SELECT * FROM workout";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allWorkouts.add(MapRowToEquipment(results));
		}
		return allWorkouts;
	}
	
	

	

	
}