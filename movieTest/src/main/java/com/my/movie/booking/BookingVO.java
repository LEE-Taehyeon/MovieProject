package com.my.movie.booking;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BookingVO {//예약
	private String booking_code;//예약 코드
	private String customer_ID;//예약자 ID
	//private String customer_name;//예약자 이름
	private String m_name;//영화 제목
	private String theater_name;//극장 이름
	private String screen_name;//상영관 이름
	private String seat_code;//좌석 코드
	private int seats_num;//예약 좌석 수
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date screening_date;//상영 날짜
	private Date book_date;//예약한 날짜
	private int booking_price;//총 예약 금액
	
	public String getBooking_code() {
		return booking_code;
	}
	public void setBooking_code(String booking_code) {
		this.booking_code = booking_code;
	}
	public String getCustomer_ID() {
		return customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}
	/*public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}*/
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public int getSeats_num() {
		return seats_num;
	}
	public void setSeats_num(int seats_num) {
		this.seats_num = seats_num;
	}
	public Date getScreening_date() {
		return screening_date;
	}
	public void setScreening_date(Date screening_date) {
		this.screening_date = screening_date;
	}
	public Date getBook_date() {
		return book_date;
	}
	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}
	public int getBooking_price() {
		return booking_price;
	}
	public void setBooking_price(int booking_price) {
		this.booking_price = booking_price;
	}
	@Override
	public String toString() {
		return "BookingVO [booking_code=" + booking_code + ", customer_ID=" + customer_ID +/* ", customer_name=" + customer_name + */", m_name=" + m_name
				+ ", theater_name=" + theater_name + ", screen_name=" + screen_name + ", seat_code=" + seat_code
				+ ", seats_num=" + seats_num + ", screening_date=" + screening_date + ", book_date=" + book_date
				+ ", booking_price=" + booking_price + "]";
	}
	
	

}
