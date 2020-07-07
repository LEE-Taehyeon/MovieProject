package com.my.movie.movie;

public class Criteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지당 출력 갯수
	
	private String m_code;//리뷰목록 출력을 위한 작업
	

	//최초 조회시 기본생성자에서 1페이지, 페이지당 10개씩
	public Criteria() {
	  this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}

 //getters/setters
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	
	//리뷰목록 출력을 위한 작업
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	//리뷰목록 출력을 위한 작업
	public Criteria(int pageNum, int amount, String m_code) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.m_code = m_code;
	}
	
	
	

	
	
	
}

