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

	// ������ ���� ������ �̵�
	@RequestMapping(value = "/addAdmin", method = RequestMethod.GET)
	public String addAdmin(AdminVO vo) {
		return "/admin/addAdmin";
	}

	// ������ ������ ���̵� �ߺ�üũ
	@ResponseBody
	@RequestMapping(value = "/chkAdminId", method = RequestMethod.POST)
	public int chkId(CustomerVO vo, AdminVO vo1, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		vo.setId(request.getParameter("id"));
		vo1.setId(request.getParameter("id"));

		int result = 0;

		// ������ ���̵��� admin���� ���̵� ��Ͻ� ����� �ȵǵ��� ����
		int adminIdCnt = adminService.adminIdChk(vo1);

		// ������ ���̵��� admin���� ���̵� ��Ͻ� ����� �ȵǵ��� ����
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

	// ������ ȸ������
	@RequestMapping(value = "/adminJoin", method = RequestMethod.POST)
	public String insertAdmin(AdminVO vo, AdminDAO adminDAO) {
		adminService.insertAdmin(vo);
		return "/admin/adminMain";
	}

	/*
	 * -----------------------------------------------------------------------------
	 * --------------------
	 */

	// ȸ�� ���� - ȸ�� ��� ���
	@RequestMapping(value = "/managemember")
	public String managemember(Criteria cri, Model model) {
		// ȸ�� ������:����¡ó������ ����
		model.addAttribute("customerList", adminService.getCustomerList(cri));
		// ����¡ó�� ���� �۾�
		int total = adminService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		// ������ ��ü ȸ���� Ȯ�ο�
		model.addAttribute("total_customer", adminService.getCustomerTotal());
		System.out.println("model" + model);
		return "/admin/managemember";
	}

	// ȸ�� ����
	@RequestMapping(value = "/CustomerDelete")
	public String CustomerDelete(HttpServletRequest request) {
		String[] id = request.getParameterValues("id");
		for (int i = 0; i < id.length; i++) {
			adminService.deleteCustomer(id[i]);
		}
		return "redirect:/movie/managemember";
	}

	// ��ȭ�� ���� - ��ȭ�� ����Ʈ ���
	@RequestMapping(value = "/managecinema")
	public String managecinema(Criteria cri, Model model) {
		// ��ȭ�� ������:����¡ó������ ����
		model.addAttribute("theaterList", adminService.getTheaterList(cri));
		// ����¡ó�� ���� �۾�
		int total = adminService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		// ������ ��ü ��ȭ���� Ȯ�ο�
		model.addAttribute("total_theater", adminService.getTheaterTotal());

		System.out.println("model" + model);
		return "/admin/managecinema";
	}

	// ��ȭ�� ���� - ��ȭ�� ����
	@RequestMapping(value = "/TheaterDelete")
	public String TheaterDelete(HttpServletRequest request) {
		String[] theater_code = request.getParameterValues("theater_code");
		for (int i = 0; i < theater_code.length; i++) {
			adminService.deleteTheater(theater_code[i]);
		}
		return "redirect:/movie/managecinema";
	}

	// ��ȭ�� ���� - ��ȭ�� ��� ������
	@RequestMapping(value = "/TheaterInsertForm")
	public String TheaterInsertForm(Model model) {
		model.addAttribute("theaterList", adminService.getTheaterList());
		System.out.println("model" + model);
		return "/admin/theaterAddForm";
	}

	// ��ȭ�� ��� - ��ȭ�� �ߺ� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/TheaterChk")
	public TheaterVO TheaterChkkhk(TheaterVO vo) {
		System.out.println("vo:" + vo);
		vo = adminService.getTheater(vo);
		System.out.println("ã�� vo:" + vo);
		return vo;
	}

	// ��ȭ�� ��� ó��
	@RequestMapping(value = "/TheaterInsert")
	public String TheaterInsert(TheaterVO vo) {
		adminService.insertTheater(vo);
		// adminService.insertScreen(vo);//�󿵰�-A�� ���
		// adminService.insertScreenB(vo);//�󿵰�-B�� ���
		return "redirect:/movie/managecinema";

	}

	// ��ȭ�� ��� ��, �¼�����
	@ResponseBody
	@RequestMapping(value = "/SaveSeat")
	public List<SeatSaveVO> SaveSeat(SeatSaveVO vo) {
		System.out.println("�¼� ���� ����");
		System.out.println("�¼� �ߺ�Ȯ��");
		System.out.println(vo.getSeat_Code());
		System.out.println(vo.getSeat());
		
		List<SeatSaveVO> vo1 = adminService.doubleChkSeat(vo);
		if(vo1.isEmpty()) {
			adminService.seatSave(vo);
		}	
		
		System.out.println("ã�� vovovovo:"+vo1);

		return vo1;
	}
	
	//�󿵽ð�ǥ ��Ͻ� , ������ ��ϵ� �󿵽ð�ǥ Ȯ��
	@ResponseBody
	@RequestMapping(value="/FindTimetableList")
	public List<TimetableVO> FindTimetableList(TimetableVO vo) {
		System.out.println("vo:"+vo);
		List<TimetableVO> vo1 = adminService.findTimetableList(vo);
		System.out.println("ã�� vo:"+vo);
		return vo1;
	}
	
	//�󿵽ð�ǥ ���� - ��ȭ �� ����ð� ���
	@ResponseBody
	@RequestMapping(value="/CalEndTime")
	public int CalEndTime(MovieVO vo) {
		MovieVO vo1 = adminService.getMovie(vo);
		int running_time = Integer.valueOf(vo1.getM_time());

		return running_time;
	}
	
	//�󿵽ð�ǥ ���� - �ߺ��� �󿵽ð�ǥ �ִ��� ��ȸ
	@ResponseBody
	@RequestMapping(value="/TimetableChk")
	public List<TimetableVO> TimetableChk(TimetableVO vo) {
		System.out.println("TimetableChk ã�� �� vo:"+vo);
		List<TimetableVO> vo1 = adminService.getTimetableChk(vo);
		System.out.println("TimetableChk ã�� �� vo1:"+vo1);

		return vo1;
	}
	
	
	
	//-----------------------------------------------------------------------------------------------------------------//
	
	
	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ����Ʈ ���
	@RequestMapping(value = "/manageTimetable")
	public String manageTimetable(Model model, TimetableVO vo) {
		model.addAttribute("timetablelist", adminService.getTimetableList(vo));
		model.addAttribute("total_timetable", adminService.getTimetableTotal());
		System.out.println("model" + model);
		return "/admin/adminTimetable";
	}

	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ����
	@RequestMapping(value = "/TimetableDelete")
	public String TimetableDelete(HttpServletRequest request) {
		String[] timetable_code = request.getParameterValues("timetable_code");
		for (int i = 0; i < timetable_code.length; i++) {
			adminService.deleteTimetable(timetable_code[i]);
		}
		return "redirect:/movie/manageTimetable";
	}

	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ��� ������
	@RequestMapping(value = "/TimetableInsertForm")
	public String TimetableInsertForm(Model model, TimetableVO vo, MovieVO vo1, TheaterVO vo2) {
		model.addAttribute("timetableList", adminService.getTimetableList(vo));
		model.addAttribute("movieList", bookingService.getMovieList(vo1));
		model.addAttribute("areaList", bookingService.getAreaList(vo2));
		System.out.println("model" + model);
		return "/admin/timetableAddForm";
	}

	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ��� ������ , ���� ����
	@ResponseBody
	@RequestMapping(value = "/TimetableInsertForm2")
	public List<TheaterVO> TimetableInsertForm2(TheaterVO vo, Model model) {
		System.out.println("����");
		List<TheaterVO> theaterList = bookingService.getTheaterList(vo);
		System.out.println("theaterList:" + theaterList);
		return theaterList;
	}

	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ��� ������ , �󿵰� ����
	@ResponseBody
	@RequestMapping(value = "/TimetableInsertForm3")
	public List<TheaterVO> TimetableInsertForm3(TheaterVO vo, Model model) {
		System.out.println("����");
		System.out.println(vo.getTheater_name());
		List<TheaterVO> screenList = adminService.getScreenList(vo);
		System.out.println("screenList:" + screenList);
		return screenList;
	}
/*
	// �󿵽ð�ǥ ��� ó��
	@RequestMapping(value = "/TimetableInsert")
	public String TimetableInsert(TimetableVO vo, HttpServletRequest request, MovieVO vo1, ScreenVO vo2, SeatVO vo3)
			throws ParseException {
		System.out.println("TimetableVO:" + vo);

		String date = (String) request.getParameter("date");
		String time = (String) request.getParameter("time");
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date screening_date = sdfDate.parse(date);
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		Date start_time = sdfTime.parse(date + time);// �� ��¥ �� �ð� dateŸ�� ��ȯ

		vo1 = adminService.getMovie(vo1);// ��ȭ���̺��� m_name, m_posterImg ��������

		vo.setM_name(vo1.getM_name());
		vo.setM_poster(vo1.getM_posterImg());
		vo.setScreening_date(screening_date);
		vo.setStart_time(start_time);//

		adminService.insertTimetable(vo);// �󿵽ð�ǥ �߰�

		// �¼����̺� �߰��ϴ� �޼ҵ� �ʿ�
		vo2 = adminService.getScreen(vo2);// �󿵰� ���� ��������
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
