package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
@Component
public class JDBCEquipmentDAO implements EquipmentDAO  {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCEquipmentDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	
	
	
	@Override
	public List<Equipment> getAllEquipment() {
		List<Equipment> allequipment = new ArrayList<>();
		String sqlSelectAll = "SELECT * FROM equipment";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allequipment.add(MapRowToEquipment(results));
		}
		return allequipment;

}
	
	
	
	
	
	
	
	private Equipment MapRowToEquipment(SqlRowSet user) {
		Equipment equipment = null;
		equipment = new Equipment();
		equipment.setEquipmentid(user.getInt("equipment_id"));
		equipment.setEquipmentName(user.getString("equipment_name"));
		equipment.setWorkoutid(user.getInt("workout_id"));
		

		return equipment;
	}

}
