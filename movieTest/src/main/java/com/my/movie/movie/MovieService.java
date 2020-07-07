package com.my.movie.movie;

import java.util.List;

public interface MovieService {
	// CRUD 기능의 메소드 구현
	// 영화 등록
	 void insertMovie(MovieVO vo);

	// 영화 수정
	void updateMovie(MovieVO vo);

	// 영화 삭제
	void deleteMovie(String m_code);

	// 영화 상세 조회
	MovieVO getMovie(MovieVO vo);

	// 영화 목록 조회
	List<MovieVO> getMovieList(MovieVO vo);
	
	List<MovieVO> getMovieList(Criteria cri);
	
	int getTotal(Criteria cri);

	MovieVO getCode(String m_code);

	// 해당 m_code에 맞는 movielist출력
	MovieVO getMovieListFromM_code(String m_code);


	
	


}
