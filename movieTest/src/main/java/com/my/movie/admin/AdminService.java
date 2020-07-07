package com.my.movie.admin;

import java.util.List;

import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieVO;
import com.my.movie.review.ReviewVO;
import com.my.movie.user.CustomerVO;
import com.my.movie.admin.SeatSaveVO;

public interface AdminService {
	/* 내가 수정 */
	//관리자 로그인 체크
	public AdminVO loginCheck(AdminVO vo);
	
	//admin table에 등록된 adminID로는 일반 회원가입이 안되도록 하기위한 작업
	public int customerIdChk(CustomerVO vo);
	
	//관리자 생성시 일반유저와 같은 아이디 있는지 체크
	public int adminIdChk(AdminVO vo1);
	
	//관리자 생성
	public void insertAdmin(AdminVO vo);
	
	
	

	public List<TheaterVO> getTheaterList(Criteria cri);
	
	public List<TheaterVO> getTheaterList();

	public int getTheaterTotal();

	public void deleteTheater(String theater_code);

	public TheaterVO getTheater(TheaterVO vo);
	
	//영화관 등록시 좌석 중복 저장확인
	public List<SeatSaveVO> doubleChkSeat(SeatSaveVO vo);
	
	//영화관 등록시 좌석 저장
	public void seatSave(SeatSaveVO vo);
	
	//상영시간표 등록시 , 이전에 등록된 상영시간표 확인
	public List<TimetableVO> findTimetableList(TimetableVO vo);
	
	
	public void insertTheater(TheaterVO vo);
	
	public void insertScreen(TheaterVO vo);

	public void insertScreenB(TheaterVO vo);

	public List<TimetableVO> getTimetableList(TimetableVO vo);

	public int getTimetableTotal();

	public void deleteTimetable(String timetable_code);

	public List<TheaterVO> getScreenList(TheaterVO vo);

	public MovieVO getMovie(MovieVO vo1);

	public void insertTimetable(TimetableVO vo);

	public ScreenVO getScreen(ScreenVO vo2);

	public void insertSeat(SeatVO vo3);
	
	
	
	//회원 관리
	//회원 목록 출력, 페이징처리관련 작업
	public List<CustomerVO> getCustomerList(Criteria cri);
	//페이징처리관련 작업
	public int getTotal(Criteria cri);
	
	//회원 목록 출력
	public List<CustomerVO> getCustomerList(ReviewVO vo);
	
	//총 회원수 출력
	public int getCustomerTotal();
	
	//회원 삭제
	public void deleteCustomer(String id);

	

	

	

	

	

	



	
}
