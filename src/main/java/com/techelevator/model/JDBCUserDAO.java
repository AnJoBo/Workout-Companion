package com.techelevator.model;

import java.time.LocalDate;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;

	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}
	
	@Override
	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		
		jdbcTemplate.update("INSERT INTO app_user(user_name, password, salt, role, email, phone, picture, fitness_goal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
				userName, hashedPassword, saltString, "user", email, phone, picture, fitnessGoal);
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM app_user "+
							      "WHERE UPPER(user_name) = ? ";
		
		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
		if(user.next()) {
			String dbSalt = user.getString("salt");
			String dbHashedPassword = user.getString("password");
			String givenPassword = hashMaster.computeHash(password, Base64.decode(dbSalt));
			return dbHashedPassword.equals(givenPassword);
		} else {
			return false;
		}
	}

	@Override
	public void updatePassword(String userName, String password) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		
		jdbcTemplate.update("UPDATE app_user SET password = ?, salt = ? WHERE user_name = ?", hashedPassword, saltString, userName);
	}
	
	@Override
	public void updateUser(String userName, String newUserName, String newEmail, String newPhone, String newPicture, String newFitnessGoal) {
		jdbcTemplate.update("UPDATE app_user SET user_name = ?, email = ?, phone = ?, picture = ?, fitness_goal = ? WHERE user_name = ?", 
							newUserName, newEmail, newPhone, newPicture, newFitnessGoal, userName);
	}
	
	@Override
	public void deleteUser(String userName) {
		jdbcTemplate.update("DELETE FROM app_user WHERE user_name = ?", userName);
	}

	@Override
	public User getUserByUserName(String userName) {
		String sqlSearchForUsername ="SELECT * "+
		"FROM app_user "+
		"WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase()); 
		User thisUser = null;
		if(user.next()) {
			thisUser = new User();
			thisUser.setUserName(user.getString("user_name"));
			thisUser.setPassword(user.getString("password"));
			thisUser.setEmail(user.getString("email"));
			thisUser.setPhone(user.getString("phone"));
			thisUser.setRole(user.getString("role"));
			thisUser.setPicture(user.getString("picture"));
			thisUser.setFitnessGoal(user.getString("fitness_goal"));
		}

		return thisUser;
	}

	@Override

	public void updateUser(String email, String phone) {
		//TODO Get this current user, check if changes are submitted, update database
	}
	

	@Override
	public void saveUserCheckInAtGym(int userId, String checkIn ) {

	public void saveUserCheckInAtGym(String userName, String checkIn ) {

		 
			jdbcTemplate.update("INSERT INTO checkin_checkout(user_id, gym_id, check_in) VALUES (?, 1, ?)", userId, checkIn);
	}

	@Override
	public void saveUserCheckInAtGym2(int userId, LocalDate checkIn) {
		// TODO Auto-generated method stub
		
	}

	
	
	@Override
	public User getUsersIdFromUserName(int username) {
		String sqlSelectUserId = "SELECT user_id "+
								"FROM app_user "+
							     "WHERE user_name = ? ";
										 
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectUserId, username);
		return (User) results;
	}
	



}