package com.techelevator.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class User {
	private String userName;
	
	@Size(min=10, message="Password too short, must be at least 10")
	@Pattern.List({
		@Pattern(regexp=".*[a-z].*", message="Must have a lower case"),
		@Pattern(regexp=".*[A-Z].*", message="Must have a capital")
	})
	private String password;
	
	private String confirmPassword;
	
	private String role;
	
	@Email(message="That's not a real e-mail") // If validation fails, this message will be passed
	@NotBlank
	private String email;
	
	// Validation?
	private String phone;
	
	private String gymCheckInDate;
	
	public String getGymCheckInDate() {
		return gymCheckInDate;
	}
	public void setGymCheckInDate(String gymCheckInDate) {
		this.gymCheckInDate = gymCheckInDate;
	}
	public String getGymCheckInOut() {
		return gymCheckInOut;
	}
	public void setGymCheckInOut(String gymCheckInOut) {
		this.gymCheckInOut = gymCheckInOut;
	}
	private String gymCheckInOut;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
