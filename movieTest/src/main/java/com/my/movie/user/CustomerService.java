package com.my.movie.user;

import java.util.ArrayList;
import java.util.List;

import com.my.movie.booking.BookingVO;
import com.my.movie.user.CustomerVO;

public interface CustomerService {
	
	public CustomerVO getCustomer(CustomerVO vo);
	
	public void updateCustomer(CustomerVO vo);
	
	public void deleteCustomer(CustomerVO vo);
	
	
	// ��� ã��
	public CustomerVO findPassword(CustomerVO vo);
	
	CustomerVO mypageCustomer(CustomerVO vo);

	public List<BookingVO> booking(CustomerVO vo);

	
	/* �߰����� */
	//ȸ������
	public void insertCustomer(CustomerVO customervo);
	
	//��������(�̸�,����,������� ��)
	public int chkConfirm(CustomerVO vo);


	

	
}
