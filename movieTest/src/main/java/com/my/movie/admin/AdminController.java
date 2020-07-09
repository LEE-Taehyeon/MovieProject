package com.my.movie.admin;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.admin.Impl.AdminDAO;
import com.my.movie.booking.BookingService;
import com.my.movie.movie.Criteria;
import com.my.movie.movie.MovieService;
import com.my.movie.movie.MovieVO;
import com.my.movie.movie.PageMaker;
import com.my.movie.user.CustomerService;
import com.my.movie.user.CustomerVO;
import com.my.movie.user.Impl.CustomerDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/movie")
public class AdminController {

	@Inject
	AdminService adminService;

	@Inject
	MovieService movieService;

	@Inject
	BookingService bookingService;

	@Autowired
	CustomerService customerService;

	// 관리자 생성 페이지 이동
	@RequestMapping(value = "/addAdmin", method = RequestMethod.GET)
	public String addAdmin(AdminVO vo) {
		return "/admin/addAdmin";
	}

	// 관리자 생성시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/chkAdminId", method = RequestMethod.POST)
	public int chkId(CustomerVO vo, AdminVO vo1, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		vo.setId(request.getParameter("id"));
		vo1.setId(request.getParameter("id"));

		int result = 0;

		// 관리자 아이디인 admin으로 아이디 등록시 등록이 안되도록 설정
		int adminIdCnt = adminService.adminIdChk(vo1);

		// 관리자 아이디인 admin으로 아이디 등록시 등록이 안되도록 설정
		if (adminIdCnt != 0) {
			result = 2;
		} else {
			int chkConfirm = adminService.customerIdChk(vo);

			if (chkConfirm != 0) {
				result = 1;
			}
		}

		return result;
	}

	// 관리자 회원가입
	@RequestMapping(value = "/adminJoin", method = RequestMethod.POST)
	public String insertAdmin(AdminVO vo, AdminDAO adminDAO) {
		adminService.insertAdmin(vo);
		return "/admin/adminMain";
	}

	/*
	 * -----------------------------------------------------------------------------
	 * --------------------
	 */

	// 회원 관리 - 회원 목록 출력
	@RequestMapping(value = "/managemember")
	public String managemember(Criteria cri, Model model) {
		// 회원 목록출력:페이징처리때문 수정
		model.addAttribute("customerList", adminService.getCustomerList(cri));
		// 페이징처리 관련 작업
		int total = adminService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		// 관리쪽 전체 회원수 확인용
		model.addAttribute("total_customer", adminService.getCustomerTotal());
		System.out.println("model" + model);
		return "/admin/managemember";
	}

	// 회원 삭제
	@RequestMapping(value = "/CustomerDelete")
	public String CustomerDelete(HttpServletRequest request) {
		String[] id = request.getParameterValues("id");
		for (int i = 0; i < id.length; i++) {
			adminService.deleteCustomer(id[i]);
		}
		return "redirect:/movie/managemember";
	}

	// 영화관 관리 - 영화관 리스트 출력
	@RequestMapping(value = "/managecinema")
	public String managecinema(Criteria cri, Model model) {
		// 영화관 목록출력:페이징처리때문 수정
		model.addAttribute("theaterList", adminService.getTheaterList(cri));
		// 페이징처리 관련 작업
		int total = adminService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		// 관리쪽 전체 영화관수 확인용
		model.addAttribute("total_theater", adminService.getTheaterTotal());

		System.out.println("model" + model);
		return "/admin/managecinema";
	}

	// 영화관 관리 - 영화관 삭제
	@RequestMapping(value = "/TheaterDelete")
	public String TheaterDelete(HttpServletRequest request) {
		String[] theater_code = request.getParameterValues("theater_code");
		for (int i = 0; i < theater_code.length; i++) {
			adminService.deleteTheater(theater_code[i]);
		}
		return "redirect:/movie/managecinema";
	}

	// 영화관 관리 - 영화관 등록 페이지
	@RequestMapping(value = "/TheaterInsertForm")
	public String TheaterInsertForm(Model model) {
		model.addAttribute("theaterList", adminService.getTheaterList());
		System.out.println("model" + model);
		return "/admin/theaterAddForm";
	}

	// 영화관 등록 - 영화관 중복 확인
	@ResponseBody
	@RequestMapping(value = "/TheaterChk")
	public TheaterVO TheaterChkkhk(TheaterVO vo) {
		System.out.println("vo:" + vo);
		vo = adminService.getTheater(vo);
		System.out.println("찾은 vo:" + vo);
		return vo;
	}

	// 영화관 등록 처리
	@RequestMapping(value = "/TheaterInsert")
	public String TheaterInsert(TheaterVO vo) {
		adminService.insertTheater(vo);
		// adminService.insertScreen(vo);//상영관-A관 등록
		// adminService.insertScreenB(vo);//상영관-B관 등록
		return "redirect:/movie/managecinema";

	}

	// 영화관 등록 시, 좌석저장
	@ResponseBody
	@RequestMapping(value = "/SaveSeat")
	public List<SeatSaveVO> SaveSeat(SeatSaveVO vo) {
		System.out.println("좌석 저장 시작");
		System.out.println("좌석 중복확인");
		System.out.println(vo.getSeat_Code());
		System.out.println(vo.getSeat());
		
		List<SeatSaveVO> vo1 = adminService.doubleChkSeat(vo);
		if(vo1.isEmpty()) {
			adminService.seatSave(vo);
		}	
		
		System.out.println("찾은 vovovovo:"+vo1);

		return vo1;
	}
	
	//상영시간표 등록시 , 이전에 등록된 상영시간표 확인
	@ResponseBody
	@RequestMapping(value="/FindTimetableList")
	public List<TimetableVO> FindTimetableList(TimetableVO vo) {
		System.out.println("vo:"+vo);
		List<TimetableVO> vo1 = adminService.findTimetableList(vo);
		System.out.println("찾은 vo:"+vo);
		return vo1;
	}
	
	//상영시간표 관리 - 영화 상영 종료시간 계산
	@ResponseBody
	@RequestMapping(value="/CalEndTime")
	public int CalEndTime(MovieVO vo) {
		MovieVO vo1 = adminService.getMovie(vo);
		int running_time = Integer.valueOf(vo1.getM_time());

		return running_time;
	}
	
	//상영시간표 관리 - 중복된 상영시간표 있는지 조회
	@ResponseBody
	@RequestMapping(value="/TimetableChk")
	public List<TimetableVO> TimetableChk(TimetableVO vo) {
		System.out.println("TimetableChk 찾기 전 vo:"+vo);
		List<TimetableVO> vo1 = adminService.getTimetableChk(vo);
		System.out.println("TimetableChk 찾기 후 vo1:"+vo1);

		return vo1;
	}
	
	
	
	//-----------------------------------------------------------------------------------------------------------------//
	
	
	// 상영시관표 관리 - 상영시간표 리스트 출력
	@RequestMapping(value = "/manageTimetable")
	public String manageTimetable(Model model, TimetableVO vo) {
		model.addAttribute("timetablelist", adminService.getTimetableList(vo));
		model.addAttribute("total_timetable", adminService.getTimetableTotal());
		System.out.println("model" + model);
		return "/admin/adminTimetable";
	}

	// 상영시간표 관리 - 상영시간표 삭제
	@RequestMapping(value = "/TimetableDelete")
	public String TimetableDelete(HttpServletRequest request) {
		String[] timetable_code = request.getParameterValues("timetable_code");
		for (int i = 0; i < timetable_code.length; i++) {
			adminService.deleteTimetable(timetable_code[i]);
		}
		return "redirect:/movie/manageTimetable";
	}

	// 상영시간표 관리 - 상영시간표 등록 페이지
	@RequestMapping(value = "/TimetableInsertForm")
	public String TimetableInsertForm(Model model, TimetableVO vo, MovieVO vo1, TheaterVO vo2) {
		model.addAttribute("timetableList", adminService.getTimetableList(vo));
		model.addAttribute("movieList", bookingService.getMovieList(vo1));
		model.addAttribute("areaList", bookingService.getAreaList(vo2));
		System.out.println("model" + model);
		return "/admin/timetableAddForm";
	}

	// 상영시간표 관리 - 상영시간표 등록 페이지 , 극장 선택
	@ResponseBody
	@RequestMapping(value = "/TimetableInsertForm2")
	public List<TheaterVO> TimetableInsertForm2(TheaterVO vo, Model model) {
		System.out.println("시작");
		List<TheaterVO> theaterList = bookingService.getTheaterList(vo);
		System.out.println("theaterList:" + theaterList);
		return theaterList;
	}

	// 상영시간표 관리 - 상영시간표 등록 페이지 , 상영관 선택
	@ResponseBody
	@RequestMapping(value = "/TimetableInsertForm3")
	public List<TheaterVO> TimetableInsertForm3(TheaterVO vo, Model model) {
		System.out.println("시작");
		System.out.println(vo.getTheater_name());
		List<TheaterVO> screenList = adminService.getScreenList(vo);
		System.out.println("screenList:" + screenList);
		return screenList;
	}
/*
	// 상영시간표 등록 처리
	@RequestMapping(value = "/TimetableInsert")
	public String TimetableInsert(TimetableVO vo, HttpServletRequest request, MovieVO vo1, ScreenVO vo2, SeatVO vo3)
			throws ParseException {
		System.out.println("TimetableVO:" + vo);

		String date = (String) request.getParameter("date");
		String time = (String) request.getParameter("time");
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date screening_date = sdfDate.parse(date);
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		Date start_time = sdfTime.parse(date + time);// 상영 날짜 및 시각 date타입 변환

		vo1 = adminService.getMovie(vo1);// 영화테이블에서 m_name, m_posterImg 가져오기

		vo.setM_name(vo1.getM_name());
		vo.setM_poster(vo1.getM_posterImg());
		vo.setScreening_date(screening_date);
		vo.setStart_time(start_time);//

		adminService.insertTimetable(vo);// 상영시간표 추가

		// 좌석테이블 추가하는 메소드 필요
		vo2 = adminService.getScreen(vo2);// 상영관 정보 가져오기
		System.out.println("seatVO:" + vo3);
		String code = vo2.getSeat_code();
		List<String> list = Arrays.asList(code.split(" "));
		for (Object obj : list) {
			String seat_code = (String) obj;
			vo3.setSeat_code(seat_code);
			adminService.insertSeat(vo3);
		}

		return "redirect:/movie/manageTimetable";

	}
	*/

}
