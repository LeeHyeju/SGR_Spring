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
import com.project.dto.CategoryDto;
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
	 
	 //상세보기
	  @RequestMapping(value = "/qna/view.do", method = RequestMethod.GET)
	  public void read(@RequestParam("qna_no") int qna_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {
		  System.out.println("qna_ 상세보기: "+ qna_no);
	    model.addAttribute( "list" , qnaService.view(qna_no));
	   System.out.println("조회수 증가");
	    qnaService.hit(qna_no);
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
	 
		// 질문 수정 
		@RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
		public void update(@RequestParam("qna_no") int qna_no, QnaDto qnaDto , Model model) throws Exception {
			System.out.println("qna 수정 - Get");
			model.addAttribute("list", qnaService.view(qna_no));
		}
	
		// 질문 수정 처리
		@RequestMapping(value = "/qna/update.do", method = RequestMethod.POST)
		public String updateProcess(QnaDto qnaDto,RedirectAttributes rttr) throws Exception {
			System.out.println("qna 수정 - Post");
			System.out.println("QnaController.dto:"+ qnaDto.toString());
			qnaService.update(qnaDto);
			return "redirect: ../qna/qnaList.do";
		}
		
		// 카테고리 삭제
		@RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST)
		public String delete(int qna_no, RedirectAttributes rttr) throws Exception {
			System.out.println("qna 삭제 - Post");
			qnaService.delete(qna_no);
			return "redirect: ../qna/qnaList.do";
		}
		
//	 //관리자 글 쓰기
//	 @RequestMapping(value = "/qna/adminWrite.ad", method = RequestMethod.GET)
//	  public void adminWrite(QnaDto qnaDto, Model model) throws Exception {
//		 System.out.println("qna- admin 글쓰기 - get");
//		 
//	 }
//	 //관리자 글쓰기 처리
//	 @RequestMapping(value = "/qna/adminWrite.ad", method = RequestMethod.POST)
//	  public String adminWrite(QnaDto qnaDto, RedirectAttributes rttr,  Model model, HttpSession session) throws Exception {
//		 System.out.println("qna- admin 글쓰기- post");
//		 System.out.println("qnadto"+qnaDto.toString());
//		 String writer = (String) session.getAttribute("mb_id");
//		 qnaDto.setMb_id(writer);
//		 qnaService.write(qnaDto);
//	    rttr.addFlashAttribute("msg", "success");
//	    return "redirect:/qna/adminList.ad";
//	  }
	 
	
	  
}
