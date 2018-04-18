package com.techelevator.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class CheckInAndOut {

	private int userId;
	private int gymId;
	private LocalDateTime checkIn;
	private LocalDateTime checkOut;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getGymId() {
		return gymId;
	}
	public void setGymId(int gymId) {
		this.gymId = gymId;
	}
	public LocalDateTime getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(LocalDateTime checkIn) {
		this.checkIn = checkIn;
	}
	public LocalDateTime getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(LocalDateTime checkOut) {
		this.checkOut = checkOut;
	}
}
