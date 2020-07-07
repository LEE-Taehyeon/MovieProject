package com.my.movie.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.movie.admin.AdminService;
import com.my.movie.admin.AdminVO;
import com.my.movie.booking.BookingService;
import com.my.movie.booking.BookingVO;
import com.my.movie.user.Impl.CustomerDAO;

@Controller
@SessionAttributes("customer")
@RequestMapping("movie")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	CustomerService customerService;
	
	@Inject
	AdminService adminService;

	// 회원가입 페이지 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(CustomerVO vo) {
		return "/user/join";
	}
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertCustomer(CustomerVO vo, CustomerDAO customerDAO) {
		customerService.insertCustomer(vo);
		return "/user/welcome";
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/chkId", method = RequestMethod.POST)
	public int chkId(CustomerVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		vo.setId(request.getParameter("id"));
		
		int result = 0;
		
		//관리자 아이디인 admin으로 아이디 등록시 등록이 안되도록 설정
		int adminIdCnt = adminService.customerIdChk(vo);
		
		//관리자 아이디인 admin으로 아이디 등록시 등록이 안되도록 설정
		if(adminIdCnt!=0) {
			result = 2;
		}else {
			int chkConfirm = adminService.customerIdChk(vo);
			
			if (chkConfirm != 0) {
				result = 1;
			}
		}

		return result;
	}
	
	//본인인증확인
	@ResponseBody
	@RequestMapping(value = "/chkConfirm", method = RequestMethod.POST)
	public int chkConfirm(CustomerVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		vo.setName(request.getParameter("name"));
		vo.setGender(request.getParameter("gender"));
		vo.setBirth(request.getParameter("birth"));
			
		int chkConfirm = customerService.chkConfirm(vo);
		int result = 0;

		if (chkConfirm != 0) {
			result = 1;
		}
		return result;
	}
	
	
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(CustomerVO vo) {
		return "/user/login";
	}

	//로그인 확인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(CustomerVO vo, AdminVO vo1, Model model, HttpSession session, RedirectAttributes rttr,
														HttpServletRequest request, HttpServletResponse response,
																				ModelAndView mav) throws Exception {
		//관리자아이디인지 일반유저 아이디인지 확인
		AdminVO admin = adminService.loginCheck(vo1);
		CustomerVO customer = customerService.getCustomer(vo);
		
		if(admin!=null) {
			session.setAttribute("admin", admin);
			return "admin/adminMain";// 관리자 페이지 이동
		}else if(customer!=null) {
			//바로 예매페이지로 이동하기 위한 작업
			String action = (String) session.getAttribute("action");
	
			if (action == null) {
				session.setAttribute("customer", customer);

				return "/include/main";
			} else {
				session.setAttribute("customer", customer);
					
				return "redirect:/movie/startBook";
			}	
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디/비밀번호를 확인하시기 바랍니다.'); history.go(-1);</script>");
            out.flush();
            
            return "/user/login";
		}
	}
	
	
	
	/* ------------------------------------------------------------------------------------------------------- */
	
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword(CustomerVO vo) {
		return "/user/forgotPassword";
	}

	// 비번찾기
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(HttpSession session, ServletRequest sq, CustomerVO vo, CustomerDAO customerDAO)
			throws Exception {
		CustomerVO c = customerService.findPassword(vo);
		if (c != null) {
			session.setAttribute("name", c.getName());
			session.setAttribute("phone", c.getPhone());
			session.setAttribute("password", c.getPassword());
		} else if (c == null) {
			session.setAttribute("name", null);
			session.setAttribute("phone", null);
			session.setAttribute("password", null);
		}

		return "/user/findPassword";

	}

	

	// 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateCustomerView(CustomerVO vo) {
		return "/user/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateCustomerproc(@ModelAttribute("customer") CustomerVO vo, CustomerDAO customerDAO) {
		customerService.updateCustomer(vo);

		return "redirect:/movie/mypage";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCustomerView(HttpSession session, CustomerVO vo, Model model) {
		vo = (CustomerVO) session.getAttribute("customer");
		vo = customerService.mypageCustomer(vo);// db에 바뀐내용 가져오기
		session.setAttribute("customer", vo);
		System.out.println("삭제:" + vo);

		return "/user/deleteForm";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteMemberproc(CustomerVO vo, HttpSession session, RedirectAttributes rttr, Model model) {

		CustomerVO customer = (CustomerVO) session.getAttribute("customer");

		String oldPass = customer.getPassword();
		String newPass = vo.getPassword();
		System.out.println(newPass);
		System.out.println(oldPass);
		if (!(oldPass.equals(newPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/movie/delete";
		}

		customerService.deleteCustomer(vo);

		return "redirect:/movie/logout";
	}

	// 마이페이지
	@RequestMapping(/* value= */"/mypage"/* ,method=RequestMethod.GET */)
	public String mypageView(CustomerVO vo, Model model, HttpSession session) {
		vo = (CustomerVO) session.getAttribute("customer");
		if (vo == null) {
			return "/user/login";
		}
		vo.setId(((CustomerVO) session.getAttribute("customer")).getId());
		model.addAttribute("customer", customerService.mypageCustomer(vo));

		model.addAttribute("booking", customerService.booking(vo));// 예매 목록
		// System.out.println(model);

		return "/user/mypage";

	}

}
