package com.techelevator.model;

public interface UserDAO {

	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);
	
	public void updateUser(String userName, String newUserName, String newEmail, String newPhone, String newPicture, String newFitnessGoal);

	public User getUserByUserName(String userName);

	public void saveUserCheckInAtGym(String userName, String checkIn);

}
