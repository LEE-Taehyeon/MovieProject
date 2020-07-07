package com.my.movie.review;

import java.util.List;

import com.my.movie.movie.Criteria;
import com.my.movie.user.CustomerVO;

public interface ReviewService {
	// CRUD 기능의 메소드 구현
	// 리뷰 등록
	public void insertReview(ReviewVO vo);
	//영화마다 리뷰넘버 1로 초기화
	public List<ReviewVO> chkFirstReview(String m_code);
	//해당 영화에 해당 아이디가 작성한 리뷰가 있는지 검토
	public int chkReviewDoubleInsert(ReviewVO vo);
	
	//리뷰 목록 출력, 페이징처리관련
	public List<ReviewVO> getReviewList(Criteria cri);
	//페이징처리 관련
	public int getTotal(Criteria cri);

	
	//리뷰목록 출력
	public List<ReviewVO> getReviewList(ReviewVO vo);
	//해당 영화 리뷰평점
	public float getReviewAvg(String m_code);
	
	//리뷰 삭제
	public void deleteReview(ReviewVO vo);
	
	//리뷰 삭제시 순번 재설정을 위한 작업
	public int getReviewListFromDelete(ReviewVO vo);
	public void reNameReview(ReviewVO vo);
	
	
	
	
	


	
}
