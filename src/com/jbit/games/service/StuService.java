package com.jbit.games.service;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.Student;

public interface StuService {
	public void add(Student student);

	public List<Student> getAll();
	public List<Map<String, Object>> getMap();
}
