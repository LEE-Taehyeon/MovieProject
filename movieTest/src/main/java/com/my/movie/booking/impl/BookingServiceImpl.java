package com.my.movie.booking.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.admin.ScreenVO;
import com.my.movie.admin.SeatVO;
import com.my.movie.admin.TheaterVO;
import com.my.movie.admin.TimetableVO;
import com.my.movie.booking.BookingService;
import com.my.movie.booking.BookingVO;
import com.my.movie.movie.MovieVO;

@Service("bookingService")
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDAO bookingDAO;
	
	//영화 제목
	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {
		return bookingDAO.getMovieList(vo);
	}
	//지역
	@Override
	public List<TheaterVO> getAreaList(TheaterVO vo) {
		return bookingDAO.getAreaList(vo);
	}
	//극장
	@Override
	public List<TheaterVO> getTheaterList(TheaterVO vo) {
		return bookingDAO.getTheaterList(vo);
	}
	//시간
	@Override
	public List<TimetableVO> getTimetableList(TimetableVO vo) {
		return bookingDAO.getTimetableList(vo);
	}
	//예매정보
	@Override
	public TimetableVO getTimetable(String timetable_code) {
		return bookingDAO.getTimetable(timetable_code);
	}
	
	//좌석정보
	@Override
	public List<SeatVO> getSeat(String timetable_code) {
		return bookingDAO.getSeat(timetable_code);
	}
	
	//예약정보 저장
	@Override
	public void insertBooking(BookingVO vo) {
		bookingDAO.insertBooking(vo);
	}
	//예약좌석 표시
	@Override
	public void updateSeat(String seat_code) {
		bookingDAO.updateSeat(seat_code);
	}
	//상영관 정보 조회
	@Override
	public ScreenVO getScreen(String screen_code) {
		return bookingDAO.getScreen(screen_code);
	}


	

}
