package com.my.movie.admin;

public class SeatSaveVO {//ÁÂ¼®
	private String seat_Code;//ÁÂ¼® ÄÚµå
	private String seat;
	
	
	public SeatSaveVO() {
	}

	

	public SeatSaveVO(String seat_Code, String seat) {
		this.seat_Code = seat_Code;
		this.seat = seat;
	}



	public String getSeat_Code() {
		return seat_Code;
	}


	public void setSeat_Code(String seat_Code) {
		this.seat_Code = seat_Code;
	}


	public String getSeat() {
		return seat;
	}


	public void setSeat(String seat) {
		this.seat = seat;
	}


	@Override
	public String toString() {
		return "SeatSaveVO [seat_Code=" + seat_Code + ", seat=" + seat + "]";
	}


	

}
