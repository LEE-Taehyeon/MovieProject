package com.my.movie.review;

public class ReviewVO {
	private String id;
	private String m_code;
	private int review_num;
	private String content;
	private int star;
	/*private int good;
	private int bad;*/
	private String regist_day;
	

	public ReviewVO() {	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	/*public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}*/
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}


	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", m_code=" + m_code + ", review_num=" + review_num + ", content=" + content
				+ ", star=" + star + ", regist_day=" + regist_day + "]";
	}
	
	

	/*@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", m_code=" + m_code + ", review_num=" + review_num + ", content=" + content
				+ ", star=" + star + ", good=" + good + ", bad=" + bad + ", regist_day=" + regist_day + "]";
	}*/


	
	
}
