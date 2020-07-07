package com.my.movie.theater.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.admin.ScreenVO;
import com.my.movie.theater.TheaterVO;


@Repository("TheaterDAO")
public class TheaterDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<TheaterVO> getTheaterList() {
		return mybatis.selectList("customerTheater.getTheaterList");
	}

	public List<TheaterVO> getTheaterName(String theater_name) {
		return mybatis.selectList("customerTheater.getTheaterName",theater_name);
	}



		
		

}
