package com.techelevator.model;

public class Workouts {

	private String equipmentName;
	private String workoutName;
	private String reps;
	private String sets;
	
	private int workoutid;
	private String workoutname;
	private String workoutimage;
	private String workoutdescription;
	private int equipmentid;
	
	
	public int getEquipmentid() {
		return equipmentid;
	}
	public void setEquipmentid(int equipment_id) {
		this.equipmentid = equipment_id;
	}
	public int getWorkoutid() {
		return workoutid;
	}
	public void setWorkoutid(int workoutid) {
		this.workoutid = workoutid;
	}
	public String getWorkoutname() {
		return workoutname;
	}
	public void setWorkoutname(String workoutname) {
		this.workoutname = workoutname;
	}
	public String getWorkoutimage() {
		return workoutimage;
	}
	public void setWorkoutimage(String workoutimage) {
		this.workoutimage = workoutimage;
	}
	public String getWorkoutdescription() {
		return workoutdescription;
	}
	public void setWorkoutdescription(String workoutdescription) {
		this.workoutdescription = workoutdescription;
	}
	
	
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getWorkoutName() {
		return workoutName;
	}
	public void setWorkoutName(String workoutName) {
		this.workoutName = workoutName;
	}
	public String getReps() {
		return reps;
	}
	public void setReps(String reps) {
		this.reps = reps;
	}
	public String getSets() {
		return sets;
	}
	public void setSets(String sets) {
		this.sets = sets;
	}
	
	
}
