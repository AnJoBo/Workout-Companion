package com.techelevator.model;

public interface UserDAO {

	public void saveUser(String userName, String password, String role, String email, String phone);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);
	
	public void updateUser(String email, String phone);

	public User getUserByUserName(String userName);

	public void saveUserCheckInAtGym(String userName, String checkIn);

}
