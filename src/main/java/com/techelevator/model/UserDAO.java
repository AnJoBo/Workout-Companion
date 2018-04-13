package com.techelevator.model;

import java.time.LocalDate;

public interface UserDAO {

	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);
	
	public void updateUser(String email, String phone);

	public User getUserByUserName(String userName);

//	public void saveUserCheckInAtGym(String userName, String checkIn);

	void saveUserCheckInAtGym(String userName, LocalDate checkIn);

}
