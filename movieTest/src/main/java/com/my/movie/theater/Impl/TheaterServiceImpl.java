package com.my.movie.theater.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.admin.ScreenVO;
import com.my.movie.theater.TheaterService;
import com.my.movie.theater.TheaterVO;

@Service("theaterService")
public class TheaterServiceImpl implements TheaterService{
	@Autowired
	private TheaterDAO theaterDAO;

	@Override
	public List<TheaterVO> getTheaterList() {
		return theaterDAO.getTheaterList();
	}

	@Override
	public List<TheaterVO> getTheaterName(String theater_name) {
		return theaterDAO.getTheaterName(theater_name);
	}




}
