package com.techelevator.model;

import java.util.List;

public interface CheckInAndOutDAO {

	public List<CheckInAndOut> getLogOfCheckins();

	public void checkInUser(int userId);

	public void checkOutUser(int userId);

	public boolean checkIfUserIsCheckedIn(String userName);

}
