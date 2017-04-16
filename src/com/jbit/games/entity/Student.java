package com.jbit.games.entity;

public class Student {
	private int no;
	private String name;
	private String gender;
	private Integer age;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Student(int no, String name, String gender, Integer age) {
		super();
		this.no = no;
		this.name = name;
		this.gender = gender;
		this.age = age;
	}
	public Student() {
		super();
	}
	
}
