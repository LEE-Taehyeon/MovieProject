package com.my.movie.user.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.booking.BookingVO;
import com.my.movie.user.CustomerService;
import com.my.movie.user.CustomerVO;


@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
	  if(vo.getId()==null|| vo.getId().equals("")){
			throw new IllegalArgumentException("");
		}
	 return customerDAO.getCustomer(vo);
	}
	
	
	
	@Override
	public void updateCustomer(CustomerVO vo) {
		customerDAO.updateCustomer(vo);
	}
 
	@Override
	public void deleteCustomer(CustomerVO vo) {
		customerDAO.deleteCustomer(vo);
	}
	

	public CustomerVO mypageCustomer(CustomerVO vo){
		return customerDAO.mypageCustomer(vo);
	}
	
	// 비번 찾기
	public CustomerVO findPassword(CustomerVO vo) {
		return customerDAO.findPassword(vo);
	}

	@Override
	public List<BookingVO> booking(CustomerVO vo) {
		return customerDAO.findBooking(vo);
	}
	
	
	
	/* 추가사항 */
	//회원가입
	@Override
	public void insertCustomer(CustomerVO customervo) {
		customerDAO.insertCustomer(customervo);
	}
	//본인인증(이름,성별,생년월일 비교)
	@Override
	public int chkConfirm(CustomerVO vo) {
		return customerDAO.chkConfirm(vo);
	}


	
	
	
}
