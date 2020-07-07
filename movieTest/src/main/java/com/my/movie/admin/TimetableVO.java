package com.my.movie.admin;

import java.sql.Date;

public class TimetableVO {//상영시간표
	private String timetable_code;//상영시간표 코드
	private String m_code;//영화 코드
	private String theater_code;//극장 코드
	private String screen_code;//상영관 코드
	private Date screening_date;//상영 날짜
	private Date start_time;//상영 시작 시각
	private Date end_time;//상영 종료 시각
	private String m_name;//영화 제목
	private String m_poster;//영화 포스터
	private String theater_name;//극장 이름
	private String theater_area;//극장 지역
	private String screen_name;//상영관 이름

	
	public String getTimetable_code() {
		return timetable_code;
	}
	public void setTimetable_code(String timetable_code) {
		this.timetable_code = timetable_code;
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
	public Date getScreening_date() {
		return screening_date;
	}
	public void setScreening_date(Date screening_date) {
		this.screening_date = screening_date;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_poster() {
		return m_poster;
	}
	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
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
	//
	@Override
	public String toString() {
		return "timetable [timetable_code=" + timetable_code + ", m_code=" + m_code + ", theater_code=" + theater_code
				+ ", screen_code=" + screen_code + ", screening_date=" + screening_date + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", m_name=" + m_name + ", m_poster=" + m_poster + ", theater_name="
				+ theater_name + ", theater_area=" + theater_area + ", screen_name=" + screen_name + "]";
	}
	
	

}
