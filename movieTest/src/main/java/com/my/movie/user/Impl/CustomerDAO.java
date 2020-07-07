package com.my.movie.user.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.booking.BookingVO;
import com.my.movie.user.CustomerVO;

@Repository("CustomerDAO")
public class CustomerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public CustomerVO getCustomer(CustomerVO vo) {
		return mybatis.selectOne("CustomerDAO.getCustomer", vo);
	}

	

	//
	public void updateCustomer(CustomerVO vo) {
		System.out.println("===> JDBC updateCustomer() ??뜝?룞?삕?뜝占??");
		mybatis.update("CustomerDAO.updateCustomer", vo);
	}

	//
	public void deleteCustomer(CustomerVO vo) {
		mybatis.delete("CustomerDAO.deleteCustomer", vo);
	}

	/*
	 * // public int passCheck(CustomerVO vo) { int
	 * result=mybatis.selectOne("CustomerDAO.getCustomer",vo);
	 * 
	 * return result; }
	 */

	//
	public CustomerVO idCheck(String id) {
		return mybatis.selectOne("CustomerDAO.idCheck", id);
	}

	//
	public CustomerVO mypageCustomer(CustomerVO vo) {
		return mybatis.selectOne("CustomerDAO.mypageCustomer", vo);
	}

	// 비번 찾기
	public CustomerVO findPassword(CustomerVO vo) {
		return mybatis.selectOne("CustomerDAO.findPassword", vo);
	}

	public List<BookingVO> findBooking(CustomerVO vo) {
		return mybatis.selectList("CustomerDAO.findBooking", vo);
	}

	
	
	/* 추가사항 */
	//회원가입
	public void insertCustomer(CustomerVO customervo) {
		mybatis.insert("CustomerDAO.insertCustomer", customervo);
	}
	//본인인증(이름,성별,생년월일 비교)
	public int chkConfirm(CustomerVO vo) {
		return mybatis.selectOne("CustomerDAO.chkConfirm", vo);
	}


}
