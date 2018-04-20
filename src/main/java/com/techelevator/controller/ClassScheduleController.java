package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.ClassScheduleDAO;

/*
 * Referenced Files include ClassScheduleController, JDBCClassScheduleDAO, and ClassScheduleDAO
 * CalendarAPITest Folder contains quickstart.html
 * 
 * Google Calendar API 

Here is your client ID
191597247625-7g143cjdnuadu7efep4g1pbjp2nr26pg.apps.googleusercontent.com

Here is your client secret
aG1fOlbaq3w59x_TU0QYxeCv

API key created
Use this key in your application by passing it with the key=API_KEY parameter.
Your API key
AIzaSyCyrP4r90dhsXCxQjIiIuCfkjWfI4A6K3g
 */


@Controller
public class ClassScheduleController {
	
	@Autowired
	private ClassScheduleDAO scheduleDAO;
	
	@Autowired
	public ClassScheduleController(ClassScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	
	@RequestMapping(path="/users/classSchedule", method=RequestMethod.GET)
	public String displayClassSchedule(ModelMap mh) {
		mh.put("allClasses", scheduleDAO.getAllClasses());
		return "classSchedule";
	}
	
	
}