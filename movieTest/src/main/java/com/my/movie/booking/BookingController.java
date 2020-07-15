package com.my.movie.booking;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.my.movie.admin.TheaterVO;
import com.my.movie.admin.TimetableVO;
import com.my.movie.movie.MovieVO;
import com.my.movie.user.CustomerVO;


@Controller
@SessionAttributes("booking")
@RequestMapping("/movie")
public class BookingController {
	@Autowired
	private BookingService bookingService;
	//예매시작
	@RequestMapping(value = "/startBook")
	public String startBook(MovieVO vo, TheaterVO vo1, CustomerVO vo2, Model model, HttpSession session) {
		vo2 = (CustomerVO)session.getAttribute("customer");
		if(vo2==null){
			session.setAttribute("action", "booking");
			return "redirect:/movie/login";
		}//로그인이 안 되어 있으면 로그인 페이지로
		model.addAttribute("movieList", bookingService.getMovieList(vo));
		model.addAttribute("areaList", bookingService.getAreaList(vo1));
		System.out.println("model:"+model);
		return "/booking/startBook";
	}
	//극장 선택
	@ResponseBody
	@RequestMapping(value = "/startBook2")
	public List<TheaterVO> startBook2(TheaterVO vo, Model model) {
		List<TheaterVO> theaterList = bookingService.getTheaterList(vo);
		System.out.println("theaterList:"+theaterList);
		return theaterList;
	}
	//시간 선택
	@ResponseBody
	@RequestMapping(value = "/startBook3")
	public List<TimetableVO> startBook3(TimetableVO vo) {
		List<TimetableVO> timetableList = bookingService.getTimetableList(vo);
		System.out.println("timetableList:"+timetableList);
		return timetableList;
	}
	
	//좌석 선택
	@RequestMapping(value = "/selectSeat")
	public String selectSeat(HttpServletRequest request, Model model) {
		String timetable_code = request.getParameter("time");
		model.addAttribute("timetable", bookingService.getTimetable(timetable_code));
		model.addAttribute("seatList", bookingService.getSeat(timetable_code));//예약된 좌석 가져오기
		System.out.println("model:"+model);
		TimetableVO vo = (TimetableVO)bookingService.getTimetable(timetable_code);
		model.addAttribute("screen", bookingService.getScreen(vo.getTheater_code()));
		System.out.println("model:"+model);
		return "/booking/selectSeat";
	}
	
	//예매 완료
	@RequestMapping(value = "/bookResult")
	public String bookResult(BookingVO vo, Model model, HttpSession session) {
		System.out.println("model:"+model);
		vo.setCustomer_ID(((CustomerVO)session.getAttribute("customer")).getId());//세션에서 ID 가져오기
		bookingService.insertBooking(vo);//예약 테이블에 저장
		String[] seatList = vo.getSeat_code().split(" ");//예약 좌석 배열로 변경
		for(int i=0; i<vo.getSeats_num();i++){
			bookingService.updateSeat(seatList[i]);//좌석테이블에서 예약여부 변경
		}
		return "/booking/bookResult";
	}
	
}
