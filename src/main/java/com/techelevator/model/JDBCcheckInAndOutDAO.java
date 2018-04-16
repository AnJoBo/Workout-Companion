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
public class JDBCcheckInAndOutDAO implements CheckInAndOutDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCcheckInAndOutDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void checkInUser(int userId) {
		String sqlInsertSurvey = "INSERT INTO checkin_checkout(user_id, gym_id, check_in) VALUES (?,?,?)";
		jdbcTemplate.update(sqlInsertSurvey, userId, 1, LocalDate.now());
	}

	@Override
	public List<CheckInAndOut> getLogOfCheckins() {
		List<CheckInAndOut> allCheckInLogs = new ArrayList<>();
		String sqlSelectAll = "SELECT * FROM checkin_checkout";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
		while (results.next()) {
			allCheckInLogs.add(MapRowToUser(results));
		}
		return allCheckInLogs;
	}
	@Override
	public boolean checkIfUserIsCheckedIn(int userId) {
		String sqlInsertCheckIn = "SELECT check_in FROM checkin_checkout WHERE user_id = ? AND check_in IS NULL AND check_out IS NULL";
		jdbcTemplate.queryForRowSet(sqlInsertCheckIn, userId);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlInsertCheckIn);
		if(results.next()) {						
			return false;
		}
		return true;
	}
	
	@Override
	public void saveUserCheckOutGym(int userId) {
		String sqlInsertSurvey =  "UPDATE checkin_checkout SET check_out = ? WHERE user_id = ? AND check_in IS NOT NULL AND  check_out IS NULL";
		jdbcTemplate.update(sqlInsertSurvey, userId, 1, LocalDate.now());
	}
		
	private CheckInAndOut MapRowToUser(SqlRowSet user) {
		CheckInAndOut thisUserCheckIn = null;
		thisUserCheckIn = new CheckInAndOut();
		thisUserCheckIn.setUserId(user.getInt("user_id"));
		thisUserCheckIn.setGymId(user.getInt("gym_id"));
		thisUserCheckIn.setCheckIn(user.getString("check_in"));
		thisUserCheckIn.setCheckIn(user.getString("check_out"));

		return thisUserCheckIn;
	}

}