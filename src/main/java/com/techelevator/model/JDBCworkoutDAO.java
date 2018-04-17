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
	
	@Override
	public List<Workouts> getAllEquipment1() {
		List<Workouts> allequipment = new ArrayList<>();
		String sqlSelectAll = "SELECT * FROM equipment";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allequipment.add(MapRowToEquipment(results));
		}
		return allequipment;
	}
	
	private Workouts MapRowToEquipment(SqlRowSet user) {
		Workouts equipment = null;
		equipment = new Workouts();
		equipment.setEquipmentName(user.getString("equipment_name"));
		equipment.setWorkoutName(user.getString("workout_name"));
		equipment.setReps(user.getString("reps"));
		equipment.setSets(user.getString("number_of_sets"));
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
		String sqlSelectAll = "SELECT * FROM equipment";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allWorkouts.add(MapRowToEquipment(results));
		}
		return allWorkouts;
	}

	@Override
	public List<Workouts> getAllEquipment() {
		// TODO Auto-generated method stub
		return null;
	}

	
}