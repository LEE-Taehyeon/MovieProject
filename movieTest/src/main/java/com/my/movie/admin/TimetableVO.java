package com.my.movie.admin;

import java.sql.Date;
//import java.sql.Time;

public class TimetableVO {//상영시간표
	private String timetable_code;//상영시간표 코드
	private String theater_code;//상영관 코드
	private Date screening_date;//상영 날짜
	private String m_code;//영화 코드
	private String start_time;//상영 시작 시각
	private String end_time;//상영 종료 시각


	public String getTimetable_code() {
		return timetable_code;
	}
	public void setTimetable_code(String timetable_code) {
		this.timetable_code = timetable_code;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public Date getScreening_date() {
		return screening_date;
	}
	public void setScreening_date(Date screening_date) {
		this.screening_date = screening_date;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


	@Override
	public String toString() {
		return "TimetableVO [timetable_code=" + timetable_code + ", theater_code=" + theater_code + ", screening_date="
				+ screening_date + ", m_code=" + m_code + ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}
	
	
	

}
