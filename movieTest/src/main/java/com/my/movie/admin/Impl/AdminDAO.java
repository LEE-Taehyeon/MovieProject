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

	/* ���� ���� */
	// ������ �α��� üũ
	public AdminVO loginCheck(AdminVO vo) {
		return mybatis.selectOne("admin.loginCheck", vo);
	}

	// admin table�� ��ϵ� adminID�δ� �Ϲ� ȸ�������� �ȵǵ��� �ϱ����� �۾�
	public int customerIdChk(CustomerVO vo) {
		return mybatis.selectOne("admin.customerIdChk", vo);
	}

	// ������ ������ �Ϲ������� ���� ���̵� �ִ��� üũ
	public int adminIdChk(AdminVO vo) {
		return mybatis.selectOne("admin.adminIdChk", vo);
	}

	// ������ ����
	public void insertAdmin(AdminVO vo) {
		mybatis.insert("admin.insertAdmin", vo);
	}

	// ��ȭ�� ���
	public List<TheaterVO> getTheaterList(Criteria cri) {
		return mybatis.selectList("admin.getTheaterList", cri);
	}

	public List<TheaterVO> getTheaterList() {
		return mybatis.selectList("admin.getTheaterList1");
	}

	// ��ȭ�� ����
	public int getTheaterTotal() {
		return mybatis.selectOne("admin.getTheaterTotal");
	}

	// ��ȭ�� ����
	public void deleteTheater(String theater_code) {
		mybatis.delete("admin.deleteTheater", theater_code);
	}

	// ��ȭ�� �ߺ� Ȯ��
	public TheaterVO getTheater(TheaterVO vo) {
		return mybatis.selectOne("admin.getTheater", vo);
	}

	// ��ȭ�� ���
	public void insertTheater(TheaterVO vo) {
		mybatis.insert("admin.insertTheater", vo);

	}

	// ��ȭ�� ��Ͻ� �¼� �ߺ����� Ȯ��
	public List<SeatSaveVO> doubleChkSeat(SeatSaveVO vo) {
		return mybatis.selectList("admin.doubleChkSeat", vo);
	}

	// ��ȭ�� ��Ͻ� �¼� ����
	public void seatSave(SeatSaveVO vo) {
		mybatis.insert("admin.seatSave", vo);

	}

	// �󿵰� ���(A��)
	public void insertScreen(TheaterVO vo) {
		mybatis.insert("admin.insertScreen", vo);
	}

	// �󿵰� ���(B��)
	public void insertScreenB(TheaterVO vo) {
		mybatis.insert("admin.insertScreenB", vo);

	}

	// �󿵽ð�ǥ ����
	public int getTimetableTotal() {
		return mybatis.selectOne("admin.getTimetableTotal");
	}

	// �󿵽ð�ǥ ����
	public void deleteTimetable(String timetable_code) {
		mybatis.delete("admin.deleteTimetable", timetable_code);

	}

	// �󿵰� ���
	public List<TheaterVO> getScreenList(TheaterVO vo) {
		return mybatis.selectList("admin.getScreenList", vo);

	}

	// ��ȭ ����
	public MovieVO getMovie(MovieVO vo1) {
		return mybatis.selectOne("admin.getMovie", vo1);
	}

	// �󿵽ð�ǥ ���
	public void insertTimetable(TimetableVO vo) {
		mybatis.insert("admin.insertTimetable", vo);

	}

	// �󿵰� ���� ��������
	public ScreenVO getScreen(ScreenVO vo2) {
		return mybatis.selectOne("admin.getScreen", vo2);
	}

	// �¼� ���
	public void insertSeat(SeatVO vo3) {
		mybatis.insert("admin.insertSeat", vo3);
	}

	// �󿵽ð�ǥ ��Ͻ� , ������ ��ϵ� �󿵽ð�ǥ Ȯ��(1)
	public List<TimetableVO> findTimetableList(TimetableVO vo) {
		return mybatis.selectList("admin.findTimetableList", vo);
	}
	// �ش� �󿵰��� ��ȭ ����, ��ȭ ������ ��ȭDB���� ��������
	public List<MovieVO> findMovieInfoList(List<TimetableVO> vo) {
		return mybatis.selectList("admin.findMovieInfoList", vo);
	}

	// �󿵽ð�ǥ ���� - �ߺ��� �󿵽ð�ǥ �ִ��� ��ȸ
	public List<TimetableVO> getTimetableChk(TimetableVO vo) {
		return mybatis.selectList("admin.getTimetableChk", vo);
	}

	// �󿵽ð�ǥ ����Ʈ ��� - ��ȭ�� �ڵ�� ����, ��ȭ��, �󿵰� ��������
	public List<TheaterVO> getTheaterList(List<TimetableVO> vo) {
		return mybatis.selectList("admin.getTheaterList_in_TimetableList", vo);
	}

	// �󿵽ð�ǥ ����Ʈ ��� - ��ȭ �ڵ�� ��ȭ����, ������ ��������
	public List<MovieVO> getMovieList(List<TheaterVO> vo) {
		return mybatis.selectList("admin.getMovieList_in_TimetableList", vo);
	}

	// �󿵽ð�ǥ ����Ʈ ���
	public List<TimetableVO> getTimetableList(TimetableVO vo) {
		return mybatis.selectList("admin.getTimetableList");
	}

	
	
	
	// ȸ������
	// ȸ����� ���, ����¡ó�� ���� �۾�
	public List<CustomerVO> getCustomerList(Criteria cri) {
		return mybatis.selectList("admin.getListWithPaging", cri);
	}

	// ����¡���� �۾�, ��ü �Ǽ� ��ȸ
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("admin.getTheaterTotal", cri);
	}

	// ȸ�� ��� ���
	public List<CustomerVO> getCustomerList(ReviewVO vo) {
		return mybatis.selectList("admin.getCustomerList", vo);
	}

	// �� ȸ���� ���
	public int getCustomerTotal() {
		return mybatis.selectOne("admin.getCustomerTotal");
	}

	// ȸ�� ����
	public void deleteCustomer(String id) {
		mybatis.delete("admin.deleteCustomer", id);
	}

	

}
