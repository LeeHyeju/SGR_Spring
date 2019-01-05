package com.project.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.model.AdminCriteria;
import com.project.common.model.PageMaker;
import com.project.common.model.SearchCriteria;
import com.project.dto.CategoryDto;
import com.project.service.AdminService;

@Controller
//@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService adminService;

	// 기본게시판 글 리스트
	@RequestMapping(value = "/admin/listAll.ad", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		System.out.println("관리자페이지: 회원목록 listAll - Get");
		model.addAttribute("list", adminService.listAll());
	}

	// 게시판 글 리스트 페이징
	@RequestMapping(value = "/admin/listCri.ad", method = RequestMethod.GET)
	public void listCri(SearchCriteria cri, Model model) throws Exception {
		System.out.println("관리자페이지: 회원목록 Cri - Get");
		model.addAttribute("list", adminService.listCriteria(cri));
	}

	// // 하단이 페이지 처리된 게시판 글 리스트
	// @RequestMapping(value="/admin/listPage.ad", method=RequestMethod.GET)
	// public void listPage(@ModelAttribute("cri") AdminCriteria cri, Model
	// model) throws Exception {
	// System.out.println("관리자페이지: 회원목록 listPage - Get");
	// model.addAttribute("list", adminService.listCriteria(cri));
	// System.out.println(cri.toString());
	// PageMaker pageMaker = new PageMaker();
	// pageMaker.setCri(cri);
	//// pageMaker.setTotalCount(21);
	// pageMaker.setTotalCount(adminService.listCountCriteria(cri));
	//
	// model.addAttribute("pageMaker", pageMaker);
	// }

	// 페이지 처리된 게시판 글 리스트 - 검색 포함 (최종)
	@RequestMapping(value = "/admin/listPage.ad", method = RequestMethod.GET)
	public void searchListPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		// model.addAttribute("list", adminService.listCriteria(cri));
		model.addAttribute("list", adminService.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		// pageMaker 입력해야할 순서 cri -> totalCount(DAO)
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(adminService.listCountCriteria(cri));
		pageMaker.setTotalCount(adminService.listSearchCount(cri));
		System.out.println(pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		// /WEB-INF/views/ + board/searchList + .jsp
	}

	// 게시판 글보기
	@RequestMapping("/admin/listDetail.ad")
	public void listDetail(@RequestParam("mb_id") String mb_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		System.out.println("회원 상세보기");
		model.addAttribute("member", adminService.listDetail(mb_id));
	}

//	// 등급 수정 
//			@RequestMapping(value = "/admin/update.ad", method = RequestMethod.GET)
//			public void update(String mb_id, Model model) throws Exception {
//				System.out.println("회원 등급 수정 - Get");
//				System.out.println(mb_id);
//				model.addAttribute("member", adminService.listDetail(mb_id));
//			}
//		
//			// 등급 수정 처리
//			@RequestMapping(value = "/admin/update.ad", method = RequestMethod.POST)
//			public String updateProcess(String mb_id,RedirectAttributes rttr) throws Exception {
//				System.out.println("회원 등급 - Post");
//				adminService.update(mb_id);
//				rttr.addFlashAttribute("msg", "updateOK");
//				return "redirect: ../category/cateList.ad";
//			}
	
	// 회원 강제 탈퇴 처리
	@RequestMapping(value = "/admin/memberDrop.ad")
	public String memberDropProcess(@RequestParam("mb_id") String mb_id, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {
		System.out.println("회원 강제 탈퇴 mb_id : " + mb_id);
		System.out.println("회원등급:");
		adminService.memberDrop(mb_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		rttr.addFlashAttribute("delete", "회원번호 " + mb_id + "번 님을 강제 탈퇴 시키셨습니다.");
		System.out.println("b");
		// 자동으로 글리스트로 이동
		return "redirect: ../admin/listPage.ad";
	}
}
