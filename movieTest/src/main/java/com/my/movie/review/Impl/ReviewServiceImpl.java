package com.my.movie.review.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.movie.Criteria;
import com.my.movie.review.ReviewService;
import com.my.movie.review.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	//리뷰 등록처리
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
	//영화마다 리뷰넘버 1로 초기화
	@Override
	public List<ReviewVO> chkFirstReview(String m_code) {
		return reviewDAO.chkFirstReview(m_code);
	}
	//해당 영화에 해당 아이디가 작성한 리뷰가 있는지 검토
	@Override
	public int chkReviewDoubleInsert(ReviewVO vo) {
		return reviewDAO.chkReviewDoubleInsert(vo);
	}
	
	
	//리뷰목록 출력. 페이징관련 작업
	@Override
	public List<ReviewVO> getReviewList(Criteria cri) {
		return reviewDAO.getReviewList(cri);
	}
	//페이징관련 작업
	@Override
	public int getTotal(Criteria cri) {
		return reviewDAO.getReviewCount(cri);
	}
	
	
	//리뷰목록 출력
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}
	///해당 영화 리뷰평점
	@Override
	public float getReviewAvg(String m_code) {
		return reviewDAO.getReviewTotal(m_code);
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}
	
	//리뷰 삭제시 순번 재설정을 위한 작업
	@Override
	public int getReviewListFromDelete(ReviewVO vo) {
		return reviewDAO.getReviewListFromDelete(vo);
	}
	@Override
	public void reNameReview(ReviewVO vo) {
		reviewDAO.reNameReview(vo);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	

}
