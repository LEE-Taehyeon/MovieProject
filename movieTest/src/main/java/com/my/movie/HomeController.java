/*package com.my.movie;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

*//**
 * Handles requests for the application home page.
 *//*
@Controller
@RequestMapping("/movie")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/include/main";
	}
	@RequestMapping(value = "/login")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/now")
	public String now(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "nowmovie";
	}
	@RequestMapping(value = "/startBook")
	public String startBook() {
		
		
		return "startBook";
	}
	@RequestMapping(value = "/future")
	public String future() {
		
		
		return "future";
	}
	
	@RequestMapping(value = "/mypage")
	public String mypage() {
		
		
		return "mypage";
	}
	
	@RequestMapping(value = "/addmovie")
	public String addmovie() {
		
		
		return "addmovie";
	}
	@RequestMapping(value = "/managemember")
	public String managemember() {
		
		
		return "managemember";
	}
	@RequestMapping(value = "/managecinema")
	public String managecinema() {
		
		
		return "managecinema";
	}
	
	
	
	
}
*/