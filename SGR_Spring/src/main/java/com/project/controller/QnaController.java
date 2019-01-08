package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.model.PageMaker;
import com.project.common.model.SearchCriteria;
import com.project.dto.QnaDto;
import com.project.service.QnaService;

@Controller
public class QnaController {

	@Inject
	private QnaService qnaService;
	
	//회원 질의응답 페이지
	 @RequestMapping(value = "/qna/qnaList.do", method = RequestMethod.GET)
	  public void qnaList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 System.out.println("qnaList-get ");
		 model.addAttribute("list", qnaService.qnaList(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(qnaService.qnaListCount(cri));
	    model.addAttribute("pageMaker", pageMaker);
	  }
	
	 //회원 글 쓰기
	 @RequestMapping(value = "/qna/write.do", method = RequestMethod.GET)
	  public void userWrite(QnaDto qnaDto, Model model) throws Exception {
		 System.out.println("qna- user 글쓰기");
	 }
	 //회원 글쓰기 처리
	 @RequestMapping(value = "/qna/write.do", method = RequestMethod.POST)
	  public String userWrite(QnaDto qnaDto, RedirectAttributes rttr) throws Exception {
		 System.out.println("qna- user 글쓰기- post");
		 qnaService.write(qnaDto);
	    rttr.addFlashAttribute("msg", "success");
	    return "redirect:/qna/qnaList.do";
	  }
	 
	 //관리자 질의응답 페이지
	 @RequestMapping(value = "/qna/adminList.ad", method = RequestMethod.GET)
	  public void adminList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	   System.out.println("qna-adminList");
		 model.addAttribute("adminList", qnaService.adminList(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(qnaService.qnaListCount(cri));
	    model.addAttribute("pageMaker", pageMaker);
	  }
	 
	 //관리자 글 쓰기
	 @RequestMapping(value = "/qna/adminWrite.ad", method = RequestMethod.GET)
	  public void adminWrite(QnaDto qnaDto, Model model) throws Exception {
		 System.out.println("qna- admin 글쓰기 - get");
		 
	 }
	 //관리자 글쓰기 처리
	 @RequestMapping(value = "/qna/adminWrite.ad", method = RequestMethod.POST)
	  public String adminWrite(QnaDto qnaDto, RedirectAttributes rttr,  Model model, HttpSession session) throws Exception {
		 System.out.println("qna- admin 글쓰기- post");
		 System.out.println("qnadto"+qnaDto.toString());
		 String writer = (String) session.getAttribute("mb_id");
		 qnaDto.setMb_id(writer);
		 qnaService.write(qnaDto);
	    rttr.addFlashAttribute("msg", "success");
	    return "redirect:/qna/adminList.ad";
	  }
	 
	 //상세보기
	  @RequestMapping(value = "/qna/view.do", method = RequestMethod.GET)
	  public void read(@RequestParam("qna_no") int qna_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {
	    model.addAttribute( "list" , qnaService.view(qna_no));
	  }
	 
	  
}
