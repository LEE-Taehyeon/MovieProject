package com.my.movie.admin;

public class ScreenVO {
	private String screen_code; 
	private String screen_name; 
	private String theater_code; 
	private String seat_code; 
	private String seats_total; 
	private String screen_price;
	
	public ScreenVO() {}

	public String getScreen_code() {
		return screen_code;
	}

	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}

	public String getScreen_name() {
		return screen_name;
	}

	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}

	public String getTheater_code() {
		return theater_code;
	}

	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}

	public String getSeat_code() {
		return seat_code;
	}

	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}

	public String getSeats_total() {
		return seats_total;
	}

	public void setSeats_total(String seats_total) {
		this.seats_total = seats_total;
	}

	public String getScreen_price() {
		return screen_price;
	}

	public void setScreen_price(String screen_price) {
		this.screen_price = screen_price;
	}

	@Override
	public String toString() {
		return "ScreenVO [screen_code=" + screen_code + ", screen_name=" + screen_name + ", theater_code="
				+ theater_code + ", seat_code=" + seat_code + ", seats_total=" + seats_total + ", screen_price="
				+ screen_price + "]";
	}
	
	
	
}
