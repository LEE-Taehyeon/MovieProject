package com.my.movie.admin.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.admin.AdminVO;
import com.my.movie.admin.ScreenVO;
import com.my.movie.admin.SeatSaveVO;
import com.my.movie.admin.SeatVO;
import com.my.movie.admin.TheaterVO;
import com.my.movie.admin.TimetableVO;
import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieVO;
import com.my.movie.review.ReviewVO;
import com.my.movie.user.CustomerVO;

@Repository("admin")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	/* 내가 수정 */
	// 관리자 로그인 체크
	public AdminVO loginCheck(AdminVO vo) {
		return mybatis.selectOne("admin.loginCheck", vo);
	}

	// admin table에 등록된 adminID로는 일반 회원가입이 안되도록 하기위한 작업
	public int customerIdChk(CustomerVO vo) {
		return mybatis.selectOne("admin.customerIdChk", vo);
	}

	// 관리자 생성시 일반유저와 같은 아이디 있는지 체크
	public int adminIdChk(AdminVO vo) {
		return mybatis.selectOne("admin.adminIdChk", vo);
	}

	// 관리자 생성
	public void insertAdmin(AdminVO vo) {
		mybatis.insert("admin.insertAdmin", vo);
	}

	// 영화관 목록
	public List<TheaterVO> getTheaterList(Criteria cri) {
		return mybatis.selectList("admin.getTheaterList", cri);
	}

	public List<TheaterVO> getTheaterList() {
		return mybatis.selectList("admin.getTheaterList1");
	}

	// 영화관 갯수
	public int getTheaterTotal() {
		return mybatis.selectOne("admin.getTheaterTotal");
	}

	// 영화관 삭제
	public void deleteTheater(String theater_code) {
		mybatis.delete("admin.deleteTheater", theater_code);
	}

	// 영화관 중복 확인
	public TheaterVO getTheater(TheaterVO vo) {
		return mybatis.selectOne("admin.getTheater", vo);
	}

	// 영화관 등록
	public void insertTheater(TheaterVO vo) {
		mybatis.insert("admin.insertTheater", vo);

	}

	// 영화관 등록시 좌석 중복저장 확인
	public List<SeatSaveVO> doubleChkSeat(SeatSaveVO vo) {
		return mybatis.selectList("admin.doubleChkSeat", vo);
	}

	// 영화관 등록시 좌석 저장
	public void seatSave(SeatSaveVO vo) {
		mybatis.insert("admin.seatSave", vo);

	}

	// 상영관 등록(A관)
	public void insertScreen(TheaterVO vo) {
		mybatis.insert("admin.insertScreen", vo);
	}

	// 상영관 등록(B관)
	public void insertScreenB(TheaterVO vo) {
		mybatis.insert("admin.insertScreenB", vo);

	}

	// 상영시간표 갯수
	public int getTimetableTotal() {
		return mybatis.selectOne("admin.getTimetableTotal");
	}

	// 상영시간표 삭제
	public void deleteTimetable(String timetable_code) {
		mybatis.delete("admin.deleteTimetable", timetable_code);

	}

	// 상영관 목록
	public List<TheaterVO> getScreenList(TheaterVO vo) {
		return mybatis.selectList("admin.getScreenList", vo);

	}

	// 영화 정보
	public MovieVO getMovie(MovieVO vo1) {
		return mybatis.selectOne("admin.getMovie", vo1);
	}

	// 상영시간표 등록
	public void insertTimetable(TimetableVO vo) {
		mybatis.insert("admin.insertTimetable", vo);

	}

	// 상영관 정보 가져오기
	public ScreenVO getScreen(ScreenVO vo2) {
		return mybatis.selectOne("admin.getScreen", vo2);
	}

	// 좌석 등록
	public void insertSeat(SeatVO vo3) {
		mybatis.insert("admin.insertSeat", vo3);
	}

	// 상영시간표 등록시 , 이전에 등록된 상영시간표 확인(1)
	public List<TimetableVO> findTimetableList(TimetableVO vo) {
		return mybatis.selectList("admin.findTimetableList", vo);
	}
	// 해당 상영관의 영화 제목, 영화 포스터 영화DB에서 가져오기
	public List<MovieVO> findMovieInfoList(List<TimetableVO> vo) {
		return mybatis.selectList("admin.findMovieInfoList", vo);
	}

	// 상영시간표 관리 - 중복된 상영시간표 있는지 조회
	public List<TimetableVO> getTimetableChk(TimetableVO vo) {
		return mybatis.selectList("admin.getTimetableChk", vo);
	}

	// 상영시간표 리스트 출력 - 영화관 코드로 지역, 영화관, 상영관 가져오기
	public List<TheaterVO> getTheaterList(List<TimetableVO> vo) {
		return mybatis.selectList("admin.getTheaterList_in_TimetableList", vo);
	}

	// 상영시간표 리스트 출력 - 영화 코드로 영화제목, 포스터 가져오기
	public List<MovieVO> getMovieList(List<TheaterVO> vo) {
		return mybatis.selectList("admin.getMovieList_in_TimetableList", vo);
	}

	// 상영시간표 리스트 출력
	public List<TimetableVO> getTimetableList(TimetableVO vo) {
		return mybatis.selectList("admin.getTimetableList");
	}

	
	
	
	// 회원관리
	// 회원목록 출력, 페이징처리 관련 작업
	public List<CustomerVO> getCustomerList(Criteria cri) {
		return mybatis.selectList("admin.getListWithPaging", cri);
	}

	// 페이징관련 작업, 전체 건수 조회
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("admin.getTheaterTotal", cri);
	}

	// 회원 목록 출력
	public List<CustomerVO> getCustomerList(ReviewVO vo) {
		return mybatis.selectList("admin.getCustomerList", vo);
	}

	// 총 회원수 출력
	public int getCustomerTotal() {
		return mybatis.selectOne("admin.getCustomerTotal");
	}

	// 회원 삭제
	public void deleteCustomer(String id) {
		mybatis.delete("admin.deleteCustomer", id);
	}

	

}
