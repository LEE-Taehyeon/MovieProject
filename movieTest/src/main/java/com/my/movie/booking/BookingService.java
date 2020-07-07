package com.my.movie.booking;

import java.util.List;

import com.my.movie.admin.ScreenVO;
import com.my.movie.admin.SeatVO;
import com.my.movie.admin.TheaterVO;
import com.my.movie.admin.TimetableVO;
import com.my.movie.movie.MovieVO;

public interface BookingService {
	//
	//영화 목록 조회
	List<MovieVO> getMovieList(MovieVO vo);
	//지역 목록 조회
	List<TheaterVO> getAreaList(TheaterVO vo);
	//극장 목록 조회
	List<TheaterVO> getTheaterList(TheaterVO vo);
	//시간 목록 조회
	List<TimetableVO> getTimetableList(TimetableVO vo);
	//예매정보 조회
	TimetableVO getTimetable(String timetable_code);
	//좌석정보 조회
	List<SeatVO> getSeat(String timetable_code);
	//예약정보 저장
	void insertBooking(BookingVO vo);
	//예약좌석 표시
	void updateSeat(String seat_code);
	//상영관 조회
	ScreenVO getScreen(String screen_code);

	
	

}
