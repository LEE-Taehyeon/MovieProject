package com.my.movie.movie;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.my.movie.review.ReviewService;
import com.my.movie.review.ReviewVO;

import javafx.scene.control.Alert;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/movie")
public class MovieController {
	@Inject
	MovieService movieService;
	
	@Inject
	ReviewService reviewService;

	// 메인화면
	@RequestMapping(value = "/")
	public String main() {

		return "/include/main";
	}

	// 메인사진수정폼
	@RequestMapping(value = "/insertImg")
	public String insertImg() {
		return "/";
	}

	// 영화목록
	@RequestMapping(value = "/getMovieList", method=RequestMethod.GET)
	public String movieList(Criteria cri, Model model, MovieVO vo) {
		//model.addAttribute("movieList",movieService.getMovieList(vo));
		model.addAttribute("movieList",movieService.getMovieList(cri));
		int total = movieService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));
		return "admin/getMovieList";
	}

	// 영화등록 폼
	@RequestMapping(value = "/insertMovieForm")
	public String insertMovieForm() {
		return "/admin/insertMovie";
	}

	// 영화등록 폼
	@RequestMapping(value = "/insertMovieFutureForm")
	public String insertMovieFutureForm() {
		return "/admin/insertMovieFuture";
	}

	// 영화등록 등록 처리
	@RequestMapping(value = "/insertMovie", method = RequestMethod.POST)
	public String insertMovie(MovieVO vo, @RequestParam("m_poster") MultipartFile uploadFile) throws IOException {
		String path = "c:/upload1/";
		// System.out.println("movieVo:"+vo);
		// 파일 업로드 처리

		// MultipartFile uploadFile = vo.getM_poster();
		System.out.println(uploadFile == null ? true : false);
		if (!uploadFile.isEmpty()) {

			vo.setM_posterImg(uploadFile.getOriginalFilename());

			String fileName = uploadFile.getOriginalFilename();
			String imageName = path + fileName;

			uploadFile.transferTo(new File(imageName));

			/* uploadFile.transferTo(new File(path + fileName)); */
		}
		movieService.insertMovie(vo);

		return "redirect:/movie/getMovieList";

	}

	// 영화수정 폼
	@RequestMapping(value = "/updateMovieForm")
	public String updateMovieForm(HttpServletRequest request, Model model) {
		String m_code = request.getParameter("movieCode");
		System.out.println("m_code" + m_code);
		model.addAttribute("movie", movieService.getCode(m_code));

		return "/admin/updateMovie";
	}

	// 영화 수정
	@RequestMapping(value = "/updateMovie")
	public String updateMovie(@ModelAttribute("movie") MovieVO vo, @RequestParam("m_poster") MultipartFile uploadFile,
			Model model) throws IOException {
		String path = "c:/upload1/";
		// 파일 업로드 처리
		if (!uploadFile.isEmpty()) {
			// 파일명세팅
			vo.setM_posterImg(uploadFile.getOriginalFilename());

			String fileName = uploadFile.getOriginalFilename();
			String imageName = path + fileName;

			uploadFile.transferTo(new File(imageName));
		}
		movieService.updateMovie(vo);
		return "redirect:/movie/getMovieList";
	}

	// 영화 삭제
	@RequestMapping("/deleteMovie")
	public String deleteMovie(MovieVO vo, Model model, HttpServletRequest request) {
		String[] m_code=request.getParameterValues("m_code");
		
		for(int i=0;i<m_code.length;i++){
			System.out.println(m_code[i]);
			movieService.deleteMovie(m_code[i]);
		}
		return "redirect:/movie/getMovieList";
	}
	/*
	 * // 영화 상세 조회
	 * 
	 * @RequestMapping("/movieinfo") 
	 * public String getBoard(MovieVO vo, Model	 * model) { 
	 * model.addAttribute("board", movieService.getMovie(vo)); // Model
	 * 정보 저장 return "/movie/movieinfo"; // View 이름 리턴 }
	 */

	// 상영중 영화
	@RequestMapping(value = "/now")
	public String now(HttpSession session, MovieVO vo,Criteria cri) {
		List<MovieVO> movieList = movieService.getMovieList(cri);
		System.out.println("nowController movieList:"+movieList);
		session.setAttribute("movie", movieList);
		return "/movie/nowmovie";
	}

	//개봉예정 영화
	@RequestMapping(value = "/future")
	public String future(Model model, MovieVO vo,Criteria cri) {
		List<MovieVO> movieList = movieService.getMovieList(cri);
		model.addAttribute("movieList", movieList);
		return "/movie/future";
	}

	
	//영화 상세정보, 리뷰관련 수정
	@RequestMapping(value = "/movieinfo")
	public String movieinfo(MovieVO vo, HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		String m_code = request.getParameter("m_code");
		System.out.println("movieinfoController m_code:"+m_code);
		
		MovieVO movieList = movieService.getMovieListFromM_code(m_code);
		
		System.out.println("movieinfoController movielist:"+movieList);
		session.setAttribute("movieList", movieList);
		
		
		// 리뷰목록출력:페이징처리
		model.addAttribute("ReviewList", reviewService.getReviewList(cri));
		
		// 페이징처리 관련 작업
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		//평균평점
		//해당 영화 리뷰평점
		float total_review_Avg;
		if(total==0) {
			total_review_Avg = 0f;
		}else {
			total_review_Avg = reviewService.getReviewAvg(m_code);
		}
		
		model.addAttribute("total_review_Avg", total_review_Avg);
		
		
		return "/movie/movieinfo";

	}


}
