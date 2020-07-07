package com.my.movie.user;

import java.util.ArrayList;
import java.util.List;

import com.my.movie.booking.BookingVO;
import com.my.movie.user.CustomerVO;

public interface CustomerService {
	
	public CustomerVO getCustomer(CustomerVO vo);
	
	public void updateCustomer(CustomerVO vo);
	
	public void deleteCustomer(CustomerVO vo);
	
	
	// 비번 찾기
	public CustomerVO findPassword(CustomerVO vo);
	
	CustomerVO mypageCustomer(CustomerVO vo);

	public List<BookingVO> booking(CustomerVO vo);

	
	/* 추가사항 */
	//회원가입
	public void insertCustomer(CustomerVO customervo);
	
	//본인인증(이름,성별,생년월일 비교)
	public int chkConfirm(CustomerVO vo);


	

	
}
