package com.my.movie.theater;

import java.util.List;

public interface TheaterService {
	
	//���弱��
	List<TheaterVO> getTheaterList();

	List<TheaterVO> getTheaterName(String theater_name);



}
