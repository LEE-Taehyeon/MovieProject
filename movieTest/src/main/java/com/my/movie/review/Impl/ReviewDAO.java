package com.my.movie.review.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieVO;
import com.my.movie.review.ReviewVO;


@Repository("ReviewDAO")
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
		
	// 리뷰 등록
	public void insertReview(ReviewVO vo) {
		mybatis.insert("review.insertReview", vo);
	}
	//영화마다 리뷰넘버 1로 초기화
	public List<ReviewVO> chkFirstReview(String m_code) {
		return mybatis.selectList("review.chkFirstReview", m_code);
	}
	//해당 영화에 해당 아이디가 작성한 리뷰가 있는지 검토
	public int chkReviewDoubleInsert(ReviewVO vo) {
		return mybatis.selectOne("review.chkReviewDoubleInsert", vo);
	}

	
	//리뷰목록 출력, 페이징관련 작업
	public List<ReviewVO> getReviewList(Criteria cri) {
		return mybatis.selectList("review.getListWithPaging", cri);
	}
	//페이징관련 작업
	public int getReviewCount(Criteria cri) {
		return mybatis.selectOne("review.getTotalCount", cri);
	}
	
	
	// 리뷰목록 출력
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return mybatis.selectList("review.getReviewList", vo);
	}
	//해당 영화 리뷰평점
	public float getReviewTotal(String m_code) {
		return mybatis.selectOne("review.getReviewAvg", m_code);
	}
	
	//리뷰 삭제
	public void deleteReview(ReviewVO vo) {
		mybatis.delete("review.deleteReview", vo);
	}
	
	//리뷰 삭제시 순번 재설정을 위한 작업
	public int getReviewListFromDelete(ReviewVO vo) {
		return mybatis.selectOne("review.getReviewListFromDelete", vo);
		
	}
	public void reNameReview(ReviewVO vo) {
		mybatis.update("review.reNameReview", vo);
		
	}
	

	
	
	

	
}
