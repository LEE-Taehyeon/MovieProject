package com.my.movie.admin;

import java.sql.Date;
//import java.sql.Time;

public class TimetableVO {//�󿵽ð�ǥ
	private String timetable_code;//�󿵽ð�ǥ �ڵ�
	private String theater_code;//�󿵰� �ڵ�
	private Date screening_date;//�� ��¥
	private String m_code;//��ȭ �ڵ�
	private String start_time;//�� ���� �ð�
	private String end_time;//�� ���� �ð�


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
