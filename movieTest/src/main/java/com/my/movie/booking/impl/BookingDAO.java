package com.my.movie.booking.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.admin.ScreenVO;
import com.my.movie.admin.SeatVO;
import com.my.movie.admin.TheaterVO;
import com.my.movie.admin.TimetableVO;
import com.my.movie.booking.BookingVO;
import com.my.movie.movie.MovieVO;

@Repository("bookingDAO")
public class BookingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	//영화 조회
	public List<MovieVO> getMovieList(MovieVO vo) {
		return mybatis.selectList("BookingDAO.selectListMovie", vo);
	}
	//지역
	public List<TheaterVO> getAreaList(TheaterVO vo) {
		return mybatis.selectList("BookingDAO.selectListArea", vo);
	}
	//극장
	public List<TheaterVO> getTheaterList(TheaterVO vo) {
		return mybatis.selectList("BookingDAO.selectListTheater", vo);
	}
	//시간
	public List<TimetableVO> getTimetableList(TimetableVO vo) {
		return mybatis.selectList("BookingDAO.selectListTimetable", vo);
	}
	//예매정보
	public TimetableVO getTimetable(String timetable_code) {
		return mybatis.selectOne("BookingDAO.selectTimetable", timetable_code);
	}
	
	//좌석정보
	public List<SeatVO> getSeat(String timetable_code) {
		return mybatis.selectList("BookingDAO.selectListSeat", timetable_code);
	}
	
	//예약 저장
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingDAO.insertBooking", vo);
		
	}
	//예약좌석 수정
	public void updateSeat(String seat_code) {
		mybatis.update("BookingDAO.updateSeat", seat_code);
		
	}
	//상영관 정보 조회
	public ScreenVO getScreen(String screen_code) {
		return mybatis.selectOne("BookingDAO.selectScreen", screen_code);
	}

}
