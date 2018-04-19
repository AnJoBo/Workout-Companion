package com.techelevator.model;

public class WorkoutMetrics {
	
	private int equipmentId;
	private String equipmentName;
	private int workoutId;
	private String workoutName;
	private int setOne;
	private int setTwo;
	private int setThree;
	private int setFour;
	private int numberOfSets;
	private int weight;
	private String workoutTime; 
	
	
	public int getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(int equipmentId) {
		this.equipmentId = equipmentId;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public int getWorkoutId() {
		return workoutId;
	}
	public void setWorkoutId(int workoutId) {
		this.workoutId = workoutId;
	}
	public String getWorkoutName() {
		return workoutName;
	}
	public void setWorkoutName(String workoutName) {
		this.workoutName = workoutName;
	}
	public int getNumberOfSets() {
		return numberOfSets;
	}
	public void setNumberOfSets(int numberOfSets) {
		this.numberOfSets = numberOfSets;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getSetOne() {
		return setOne;
	}
	public void setSetOne(int setOne) {
		this.setOne = setOne;
	}
	public int getSetTwo() {
		return setTwo;
	}
	public void setSetTwo(int setTwo) {
		this.setTwo = setTwo;
	}
	public int getSetThree() {
		return setThree;
	}
	public void setSetThree(int setThree) {
		this.setThree = setThree;
	}
	public int getSetFour() {
		return setFour;
	}
	public void setSetFour(int setFour) {
		this.setFour = setFour;
	}
	public String getWorkoutTime() {
		return workoutTime;
	}
	public void setWorkoutTime(String workoutTime) {
		this.workoutTime = workoutTime;
	}
}
