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
	public void saveUserCheckInAtGym(int userId) {
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
	public void saveUserCheckOutGym(int userId, String checkOut) {
		jdbcTemplate.update("INSERT INTO checkin_checkout(user_id, gym_id, check_in) VALUES ('" + userId + "', 2, '"
				+ checkOut + "')");

	}

//	@Override
//	public SqlRowSet CheckInAndOut getAllCheckInsByUserId(int userId) {
//		String sqlSearchForId = "SELECT * " + "FROM checkin_checkout " + "WHERE (user_id) = ? ";
//	}
			
	private CheckInAndOut MapRowToUser(SqlRowSet user) {
		CheckInAndOut thisUserCheckIn = null;
		thisUserCheckIn = new CheckInAndOut();
		thisUserCheckIn.setUserId(user.getInt("user_id"));
		thisUserCheckIn.setGymId(user.getInt("gym_id"));
		thisUserCheckIn.setCheckIn(user.getString("check_in"));
		thisUserCheckIn.setCheckIn(user.getString("check_out"));

		return thisUserCheckIn;
	}

	@Override
	public void saveUserCheckInAtGym(int userId, String checkIn) {
		// TODO Auto-generated method stub
		
	}

//	private CheckInAndOut MapRowToUser(SqlRowSet row) {
//		CheckInAndOut user = new CheckInAndOut();
//		user.setUserId(row.getInt("user_id"));
//		user.setGymId(row.getInt("gym_id"));
//		user.setCheckIn(row.getString("check_in"));
//		user.setCheckOut(row.getString("check_out"));
//
//		return user;
//	}

	// @Override
	// public void saveUserCheckInAtGym(int userId, LocalDate checkIn ) {
	// jdbcTemplate.update("INSERT INTO checkin_checkout(user_id, gym_id, check_in)
	// VALUES (?, ?, ?)", userId, 2, checkIn);
	// }

}