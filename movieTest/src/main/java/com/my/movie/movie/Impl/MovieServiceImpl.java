package com.my.movie.movie.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieService;
import com.my.movie.movie.MovieVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void insertMovie(MovieVO vo) {
		movieDAO.insertMovie(vo);
	}

	@Override
	public void updateMovie(MovieVO vo) {
		movieDAO.updateMovie(vo);
	}

	@Override
	public void deleteMovie(String m_code) {
		movieDAO.deleteMovie(m_code);
	}

	@Override
	public MovieVO getMovie(MovieVO vo) {
		return movieDAO.getMovie(vo);
	}

	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {
		return movieDAO.getMovieList(vo);
	}

	@Override
	public MovieVO getCode(String m_code) {
		return movieDAO.getCode(m_code);
	}

	@Override
	public List<MovieVO> getMovieList(Criteria cri) {
		return movieDAO.getMovieList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return movieDAO.getTotalCount(cri);
	}

	// 해당 m_code에 맞는 movielist출력
	@Override
	public MovieVO getMovieListFromM_code(String m_code) {
		return movieDAO.getMovieListFromM_code(m_code);
	}


	
	


	

}
