package com.my.movie.admin;

import java.util.List;

import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieVO;
import com.my.movie.review.ReviewVO;
import com.my.movie.user.CustomerVO;
import com.my.movie.admin.SeatSaveVO;

public interface AdminService {
	/* ���� ���� */
	//������ �α��� üũ
	public AdminVO loginCheck(AdminVO vo);
	
	//admin table�� ��ϵ� adminID�δ� �Ϲ� ȸ�������� �ȵǵ��� �ϱ����� �۾�
	public int customerIdChk(CustomerVO vo);
	
	//������ ������ �Ϲ������� ���� ���̵� �ִ��� üũ
	public int adminIdChk(AdminVO vo1);
	
	//������ ����
	public void insertAdmin(AdminVO vo);
	
	
	

	public List<TheaterVO> getTheaterList(Criteria cri);
	
	public List<TheaterVO> getTheaterList();

	public int getTheaterTotal();

	public void deleteTheater(String theater_code);

	public TheaterVO getTheater(TheaterVO vo);
	
	//��ȭ�� ��Ͻ� �¼� �ߺ� ����Ȯ��
	public List<SeatSaveVO> doubleChkSeat(SeatSaveVO vo);
	
	//��ȭ�� ��Ͻ� �¼� ����
	public void seatSave(SeatSaveVO vo);
	
	//�󿵽ð�ǥ ��Ͻ� , ������ ��ϵ� �󿵽ð�ǥ Ȯ��
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
	
	
	
	//ȸ�� ����
	//ȸ�� ��� ���, ����¡ó������ �۾�
	public List<CustomerVO> getCustomerList(Criteria cri);
	//����¡ó������ �۾�
	public int getTotal(Criteria cri);
	
	//ȸ�� ��� ���
	public List<CustomerVO> getCustomerList(ReviewVO vo);
	
	//�� ȸ���� ���
	public int getCustomerTotal();
	
	//ȸ�� ����
	public void deleteCustomer(String id);

	

	

	

	

	

	



	
}
