package com.techelevator.model;


import java.util.ArrayList;
import java.util.List;

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
	public List<User> getAllUsers() {
		List<User> allUsers = new ArrayList<>();
		String sqlSelectAllUsers = "SELECT * FROM app_user ORDER BY user_name ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllUsers);
		while (results.next()) {
			allUsers.add(MapRowToUser(results));
		}
		return allUsers;
	}

	@Override
	public User getUserByUserName(String userName) {
		User thisUser = null;
		String sqlSearchForUsername = "SELECT * " + "FROM app_user " + "WHERE UPPER(user_name) = ? ";
		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase());
		while(user.next()) {
			thisUser = MapRowToUser(user);
		}
		return thisUser;
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * " + "FROM app_user " + "WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
		if (user.next()) {
			String dbSalt = user.getString("salt");
			String dbHashedPassword = user.getString("password");
			String givenPassword = hashMaster.computeHash(password, Base64.decode(dbSalt));
			return dbHashedPassword.equals(givenPassword);
		} else {
			return false;
		}
	}

	@Override
	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));

		jdbcTemplate.update("INSERT INTO app_user(user_name, password, salt, role, email, phone, picture, fitness_goal) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", userName, hashedPassword, saltString, "user", email, phone, picture, fitnessGoal);
	}

	@Override
	public void updateUser(String userName, String newUserName, String newEmail, String newPhone, String newPicture, String newFitnessGoal, String password) {
		if(searchForUsernameAndPassword(userName, password)) {
			jdbcTemplate.update("UPDATE app_user SET user_name = ?, email = ?, phone = ?, picture = ?, fitness_goal = ? WHERE user_name = ?", 
					newUserName, newEmail, newPhone, newPicture, newFitnessGoal, userName);
			return;
		}
		return;
	}

	@Override
	public void updatePassword(String userName, String password, String newPassword) {
		if(searchForUsernameAndPassword(userName, password)) {
			byte[] salt = hashMaster.generateRandomSalt();
			String hashedPassword = hashMaster.computeHash(newPassword, salt);
			String saltString = new String(Base64.encode(salt));

			jdbcTemplate.update("UPDATE app_user SET password = ?, salt = ? WHERE user_name = ?", hashedPassword, saltString, userName);
			return;
		}
		return;
	}

	@Override
	public void updateUserRole(String userName, String role) {
		jdbcTemplate.update("UPDATE app_user SET role = ? WHERE user_name = ?", role, userName);
	}

	@Override
	public void deleteUser(String userName) {
		jdbcTemplate.update("DELETE FROM app_user WHERE user_name = ?", userName);
	}

	private User MapRowToUser(SqlRowSet row) {
		User user = new User();
		user.setUserId(row.getInt("user_id"));
		user.setUserName(row.getString("user_name"));
		user.setEmail(row.getString("email"));
		user.setPhone(row.getString("phone"));
		user.setFitnessGoal(row.getString("fitness_goal"));
		user.setRole(row.getString("role"));
		user.setPicture(row.getString("picture"));
		user.setFitnessGoal(row.getString("fitness_goal"));
		return user;
	}

}