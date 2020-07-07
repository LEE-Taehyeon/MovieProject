package com.my.movie.movie;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="movieList")
@XmlAccessorType(XmlAccessType.FIELD)
public class MovieListVO {
	
	@XmlElement(name="movie")
	private List<MovieVO> movieList;
	
	public List<MovieVO> getMovieLsit(){
		return movieList;
	}
	
	public void setMovieList(List<MovieVO> movieList){
		this.movieList = movieList;
	}
}
