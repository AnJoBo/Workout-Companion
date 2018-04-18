package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class JDBCClassScheduleDAO implements ClassScheduleDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCClassScheduleDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Class> getAllClasses() {
		List<Class> classes = new ArrayList<>();
		return classes;
		// most likely not returning a List of Classes considering we will be getting info from an API 
	}
}