package com.my.movie.theater;

public class TheaterVO {
	private String theater_code; 
	private String theater_name; 
	private String theater_area;
	private String screen_name;



	public TheaterVO() {}


	public String getTheater_code() {
		return theater_code;
	}


	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}


	public String getTheater_name() {
		return theater_name;
	}


	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}


	public String getTheater_area() {
		return theater_area;
	}


	public void setTheater_area(String theater_area) {
		this.theater_area = theater_area;
	}
	
	
	public String getScreen_name() {
		return screen_name;
	}

	
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}



	@Override
	public String toString() {
		return "TheaterVO [theater_code=" + theater_code + ", theater_name=" + theater_name + ", theater_area="
				+ theater_area + ", screen_name=" + screen_name + "]";
	}


	

}
