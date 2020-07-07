package com.my.movie.admin;

public class SeatVO {//좌석
	private String seat_code;//좌석 코드
	private String timetable_code;//상영시간표 코드
	private String booking_code;//예약 코드
	private String m_code;//영화 코드
	private String theater_code;//극장 코드
	private String screen_code;//상영관 코드
	private int isbooked;//예약 여부, 비예약 좌석 - 0, 예약 좌석 - 1
	//
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getTimetable_code() {
		return timetable_code;
	}
	public void setTimetable_code(String timetable_code) {
		this.timetable_code = timetable_code;
	}
	public String getBooking_code() {
		return booking_code;
	}
	public void setBooking_code(String booking_code) {
		this.booking_code = booking_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public int getIsbooked() {
		return isbooked;
	}
	public void setIsbooked(int isbooked) {
		this.isbooked = isbooked;
	}
	//
	@Override
	public String toString() {
		return "SeatVO [seat_code=" + seat_code + ", timetable_code=" + timetable_code + ", booking_code="
				+ booking_code + ", m_code=" + m_code + ", theater_code=" + theater_code + ", screen_code="
				+ screen_code + ", isbooked=" + isbooked + "]";
	}
	
	

}
