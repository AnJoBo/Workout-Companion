package com.techelevator.model;


import java.time.LocalDate;

import java.util.List;


public interface UserDAO {

	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);
	
	public void updateUser(String userName, String newUserName, String newEmail, String newPhone, String newPicture, String newFitnessGoal);

	public User getUserByUserName(String userName);
	
	public List<User> getAllUsers();

	public void saveUserCheckInAtGym(int userId, String checkIn);

	public void deleteUser(String userName);
	
	public void updateUserRole(String userName, String role);
	

}
