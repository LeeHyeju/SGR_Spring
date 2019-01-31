package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.model.PageMaker;
import com.project.common.model.SearchCriteria;
import com.project.dto.ReviewDto;
import com.project.service.ReviewService;

@Controller
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	//리스트
	@RequestMapping(value="/review/reviewList.do", method=RequestMethod.GET)
	public void list(ReviewDto reviewDto, SearchCriteria cri, Model model) throws Exception{
		System.out.println("review 게시판 -get");
		model.addAttribute("review",  reviewService.reviewList(cri));
		 PageMaker pageMaker = new PageMaker();
		  pageMaker.setCri(cri);
		  pageMaker.setTotalCount(reviewService.reviewCount(cri));
	      model.addAttribute("pageMaker", pageMaker);
	}
	
	//상세보기
	  @RequestMapping(value = "/review/view.do", method = RequestMethod.GET)
	  public void read(@RequestParam("review_no") int review_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {
		  System.out.println("review 상세보기: "+ review_no);
	    model.addAttribute( "review" , reviewService.view(review_no));
	   System.out.println("조회수 증가");
	    reviewService.hit(review_no);
	  }
	
	  //글 쓰기
	  @RequestMapping(value = "/review/write.do", method = RequestMethod.GET)
	  public void insert(ReviewDto reviewDto, 
			  int goods_no, String catesub_cd, HttpServletRequest request, Model model) throws Exception{
		  System.out.println("review 글 쓰기 -get");
		  System.out.println("goods_no:"+goods_no);
		  System.out.println("catesub_cd:"+catesub_cd);
	  }
	  
	  //글 쓰기 처리
	  @RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	  public String insertProcess(ReviewDto reviewDto, RedirectAttributes rttr) throws Exception{
		  System.out.println("review 글 쓰기 -post");
		  reviewService.write(reviewDto);
		  rttr.addFlashAttribute("msg", "success");
		    return "redirect:/review/reviewList.do";
	  }
	  
	  
}
