package com.techelevator.model;

import java.util.List;

public interface UserDAO {

	public void saveUser(String userName, String password, String role, String email, String phone, String picture, String fitnessGoal);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password, String newPassword);
	
	public void updateUser(String userName, String newUserName, String newEmail, String newPhone, String newPicture, String newFitnessGoal, String password);

	public User getUserByUserName(String userName);
	
	public List<User> getAllUsers();

	public void deleteUser(String userName);
	
	public void updateUserRole(String userName, String role);

}
