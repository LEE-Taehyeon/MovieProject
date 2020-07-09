package com.my.movie.admin.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.admin.AdminService;
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

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	/* ���� ���� */
	// ������ �α��� üũ
	@Override
	public AdminVO loginCheck(AdminVO vo) {
		return adminDAO.loginCheck(vo);
	}

	// admin table�� ��ϵ� adminID�δ� �Ϲ� ȸ�������� �ȵǵ��� �ϱ����� �۾�
	@Override
	public int customerIdChk(CustomerVO vo) {
		return adminDAO.customerIdChk(vo);
	}

	// ������ ������ �Ϲ������� ���� ���̵� �ִ��� üũ
	@Override
	public int adminIdChk(AdminVO vo) {
		return adminDAO.adminIdChk(vo);
	}

	// ������ ����
	@Override
	public void insertAdmin(AdminVO vo) {
		adminDAO.insertAdmin(vo);
	}

	// ��ȭ�� ��� ���
	@Override
	public List<TheaterVO> getTheaterList(Criteria cri) {
		return adminDAO.getTheaterList(cri);
	}

	@Override
	public List<TheaterVO> getTheaterList() {
		return adminDAO.getTheaterList();
	}

	// ��ȭ�� ����
	@Override
	public int getTheaterTotal() {
		return adminDAO.getTheaterTotal();
	}

	// ��ȭ�� ����
	@Override
	public void deleteTheater(String theater_code) {
		adminDAO.deleteTheater(theater_code);
	}

	// ��ȭ�� �ߺ� Ȯ��
	@Override
	public TheaterVO getTheater(TheaterVO vo) {
		return adminDAO.getTheater(vo);
	}

	// ��ȭ�� ���
	@Override
	public void insertTheater(TheaterVO vo) {
		adminDAO.insertTheater(vo);

	}

	// ��ȭ�� ��Ͻ� �¼� �ߺ� ���� Ȯ��
	@Override
	public List<SeatSaveVO> doubleChkSeat(SeatSaveVO vo) {
		return adminDAO.doubleChkSeat(vo);
	}
	//��ȭ�� ��Ͻ� �¼� ����
	@Override
	public void seatSave(SeatSaveVO vo) {
		adminDAO.seatSave(vo);
		
	}
	
	//�󿵽ð�ǥ ��Ͻ� , ������ ��ϵ� �󿵽ð�ǥ Ȯ��(1)
	@Override
	public List<TimetableVO> findTimetableList(TimetableVO vo) {
		return adminDAO.findTimetableList(vo);
	}
	
	// �󿵽ð�ǥ ���� - �ߺ��� �󿵽ð�ǥ �ִ��� ��ȸ
	@Override
	public List<TimetableVO> getTimetableChk(TimetableVO vo) {
		return adminDAO.getTimetableChk(vo);
	}
	
	
	
	
	

	// �󿵰� ���(A��)
	@Override
	public void insertScreen(TheaterVO vo) {
		adminDAO.insertScreen(vo);

	}

	// �󿵰� ���(B��)
	@Override
	public void insertScreenB(TheaterVO vo) {
		adminDAO.insertScreenB(vo);

	}

	// �󿵽ð�ǥ ��� ���
	@Override
	public List<TimetableVO> getTimetableList(TimetableVO vo) {
		return adminDAO.getTimetableList(vo);
	}

	// �󿵽ð�ǥ ����
	@Override
	public int getTimetableTotal() {
		return adminDAO.getTimetableTotal();
	}

	// �󿵽ð�ǥ
	@Override
	public void deleteTimetable(String timetable_code) {
		adminDAO.deleteTimetable(timetable_code);

	}

	// �󿵰� ���
	@Override
	public List<TheaterVO> getScreenList(TheaterVO vo) {
		return adminDAO.getScreenList(vo);
	}

	// �󿵽ð�ǥ�� ������ ��ȭ ���� ��������
	@Override
	public MovieVO getMovie(MovieVO vo1) {
		return adminDAO.getMovie(vo1);
	}

	// �󿵽ð�ǥ ���
	@Override
	public void insertTimetable(TimetableVO vo) {
		adminDAO.insertTimetable(vo);

	}

	// �󿵰� ����
	@Override
	public ScreenVO getScreen(ScreenVO vo2) {
		return adminDAO.getScreen(vo2);
	}

	// �¼� ���
	@Override
	public void insertSeat(SeatVO vo3) {
		adminDAO.insertSeat(vo3);

	}

	// ȸ������
	// ȸ����� ��� , ����¡ó��
	@Override
	public List<CustomerVO> getCustomerList(Criteria cri) {
		return adminDAO.getCustomerList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return adminDAO.getTotalCount(cri);
	}

	// ȸ����� ���
	@Override
	public List<CustomerVO> getCustomerList(ReviewVO vo) {
		return adminDAO.getCustomerList(vo);
	}

	// �������� �� ȸ���� ����
	@Override
	public int getCustomerTotal() {
		return adminDAO.getCustomerTotal();
	}

	// ȸ�� ����
	@Override
	public void deleteCustomer(String id) {
		adminDAO.deleteCustomer(id);
	}

	

	

	

}
