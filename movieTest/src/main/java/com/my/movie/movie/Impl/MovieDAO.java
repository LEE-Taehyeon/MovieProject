package com.my.movie.movie.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieVO;


@Repository("MovieDAO")
public class MovieDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

		// 영화 등록
		public void insertMovie(MovieVO vo) {
			  mybatis.insert("movie.insertMovie",vo);
		}

		// 영화 수정
		public void updateMovie(MovieVO vo) {
			System.out.println("===> JDBC로 updateBoard() 기능 처리");
			mybatis.update("movie.updateMovie",vo);
		}

		// 영화 삭제
		public void deleteMovie(String m_code) {
			mybatis.delete("movie.deleteMovie", m_code);
		}

		// 영화 상세 조회
		public MovieVO getMovie(MovieVO vo) {
			System.out.println("===> JDBC로 getMovie() 기능 처리");
			return mybatis.selectOne("movie.getMovie", vo);
		}
		// 영화 리스트 조회
		public List<MovieVO> getMovieList(MovieVO vo) {
			return mybatis.selectList("movie.getMovieList",vo);
		}

		public MovieVO getCode(String m_code) {

			return mybatis.selectOne("movie.getCode", m_code);
		}
		
		//전체 글 조회
		public List<MovieVO> getMovieList(Criteria cri) {
			return mybatis.selectList("movie.getListWithPaging", cri);
		}
		//전체 건수 조회
		public int getTotalCount(Criteria cri) {
			return mybatis.selectOne("movie.getTotalCount", cri);
		}

		
		// 해당 m_code에 맞는 movielist출력
		public MovieVO getMovieListFromM_code(String m_code) {
			return mybatis.selectOne("movie.getMovieListFromMcode",m_code);
		}

		
		

}
