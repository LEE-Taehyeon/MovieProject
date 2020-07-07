package com.my.movie.theater;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.my.movie.admin.ScreenVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("theater")
@RequestMapping("/movie")
public class TheaterController {
	@Inject
	TheaterService theaterService;

	// ��ȭ�� ���
	@RequestMapping(value = "/theater")
	public String getTheaterList(HttpSession session, TheaterVO vo) {
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		System.out.println("theaterController theaterList:" + theaterList);
		session.setAttribute("theaterList", theaterList);
		return "/theater/theaterList";
	}

	// �󿵽ð�ǥ ���� - �󿵽ð�ǥ ��� ������ , �󿵰� ����
	@ResponseBody
	@RequestMapping(value = "/TheaterNameSelect")
	public List<TheaterVO> TheaterNameSelect(TheaterVO vo, Model model) {
		System.out.println("����");
		System.out.println(vo.getTheater_area());
		List<TheaterVO> theaterName = theaterService.getTheaterName(vo.getTheater_area());
		System.out.println("theaterName:" + theaterName);
		return theaterName;
	}


}
