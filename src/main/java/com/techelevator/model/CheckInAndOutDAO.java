package com.techelevator.model;

import java.util.List;

public interface CheckInAndOutDAO {

	public List<CheckInAndOut> getLogOfCheckins();

	public void checkInUser(int userId);

	public void saveUserCheckOutGym(int userId);

	public boolean checkIfUserIsCheckedIn(int userId);

}
