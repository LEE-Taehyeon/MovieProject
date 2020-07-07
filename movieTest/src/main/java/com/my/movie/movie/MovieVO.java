package com.my.movie.movie;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	private String m_code; 
	private String  m_name; 
	private String  m_director;    
	private String  m_actor; 
	private String  m_company; 
	private String  m_time; 
	private String  m_playDate; 
	private String  m_description; 
	private String  m_posterImg;
	//private MultipartFile  m_poster;

	
	public MovieVO() {}
	
	@Override
	public String toString() {
		return "MovieVO [m_code=" + m_code + ", m_name=" + m_name + ", m_director=" + m_director + ", m_actor="
				+ m_actor + ", m_company=" + m_company + ", m_time=" + m_time + ", m_playDate=" + m_playDate
				+ ", m_description=" + m_description + ", m_posterImg=" + m_posterImg  + "]";
	}

	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public String getM_actor() {
		return m_actor;
	}
	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}
	public String getM_company() {
		return m_company;
	}
	public void setM_company(String m_company) {
		this.m_company = m_company;
	}
	public String getM_time() {
		return m_time;
	}
	public void setM_time(String m_time) {
		this.m_time = m_time;
	}
	public String getM_playDate() {
		return m_playDate;
	}
	public void setM_playDate(String m_playDate) {
		this.m_playDate = m_playDate;
	}
	public String getM_description() {
		return m_description;
	}
	public void setM_description(String m_description) {
		this.m_description = m_description;
	}
	/*public MultipartFile getM_poster() {
		return m_poster;
	}
	public void setM_poster(MultipartFile m_poster) {
		this.m_poster = m_poster;
	}*/
	public String getM_posterImg() {
		return m_posterImg;
	}
	public void setM_posterImg(String m_posterImg) {
		this.m_posterImg = m_posterImg;
	}
}
