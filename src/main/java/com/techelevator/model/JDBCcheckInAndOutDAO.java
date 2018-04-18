package com.techelevator.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCcheckInAndOutDAO implements CheckInAndOutDAO {

	private JdbcTemplate jdbcTemplate;
	
	//private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	@Autowired
	public JDBCcheckInAndOutDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void checkInUser(int userId) {
		LocalDateTime now = LocalDateTime.now();
		String sqlCheckIn = "INSERT INTO checkin_checkout (user_id, gym_id, check_in) VALUES (?, ?, ?)";
		jdbcTemplate.update(sqlCheckIn, userId, 1, now);
	}
	
	@Override
	public boolean checkIfUserIsCheckedIn(String userName) {
		String sqlCheckInCheck = "SELECT check_in FROM checkin_checkout "
								+ "JOIN app_user on checkin_checkout.user_id = app_user.user_id "
								+ "WHERE UPPER(app_user.user_name) = ? AND check_in IS NOT NULL AND check_out IS NULL";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCheckInCheck, userName.toUpperCase());
		if(results.next()) {						
			return true;
		}
		return false;
	}

	@Override
	public void checkOutUser(int userId) {
		LocalDateTime now = LocalDateTime.now();
		String sqlInsertSurvey =  "UPDATE checkin_checkout SET check_out = ? WHERE user_id = ? AND check_in IS NOT NULL AND check_out IS NULL";
		jdbcTemplate.update(sqlInsertSurvey, now, userId);
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
		
	private CheckInAndOut MapRowToUser(SqlRowSet user) {
		CheckInAndOut thisUserCheckIn = null;
		thisUserCheckIn = new CheckInAndOut();
		thisUserCheckIn.setUserId(user.getInt("user_id"));
		thisUserCheckIn.setGymId(user.getInt("gym_id"));
		thisUserCheckIn.setCheckIn(user.getTimestamp("check_in").toLocalDateTime());
		thisUserCheckIn.setCheckOut(user.getTimestamp("check_out").toLocalDateTime());

		return thisUserCheckIn;
	}

}