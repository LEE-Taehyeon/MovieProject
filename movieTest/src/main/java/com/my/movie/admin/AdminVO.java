package com.my.movie.admin;

public class AdminVO {
	private String id;
	private String password;
	private String name;
	private int power;
	

	public AdminVO() {}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	public int getPower() {
		return power;
	}


	public void setPower(int power) {
		this.power = power;
	}


	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", password=" + password + ", name=" + name + ", power=" + power + "]";
	}


	
	
	
	
}
