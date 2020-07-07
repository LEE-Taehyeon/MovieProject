package com.my.movie.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("movie")
public class LogoutController {
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/user/login";
	}
}
