package com.techelevator.model;

import java.util.List;

public interface CheckInAndOutDAO {

	void saveUserCheckInAtGym(int userId, String checkIn);

	public List<CheckInAndOut> getLogOfCheckins();

	

	void saveUserCheckInAtGym(int userId);

	void saveUserCheckOutGym(int userId, String checkOut);

//	CheckInAndOut getAllCheckInsByUserId(int userId);

}
