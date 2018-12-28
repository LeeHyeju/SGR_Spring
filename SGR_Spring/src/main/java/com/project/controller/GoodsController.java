package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.model.PageMaker;
import com.project.common.model.SearchCriteria;
import com.project.service.GoodsService;

@Controller
public class GoodsController {

	@Inject
	private GoodsService goodsService;
	
	// 페이지 처리된 게시판 글 리스트 - 검색 포함 (최종)
	@RequestMapping(value = "/goods/goodsList.do", method = RequestMethod.GET)
	public String goodsList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		System.out.println("goodsList-get");
		model.addAttribute("list", goodsService.list(cri));
		PageMaker pageMaker = new PageMaker();
		// pageMaker 입력해야할 순서 cri -> totalCount(DAO)
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(goodsService.listCount(cri));
		System.out.println(pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		// /WEB-INF/views/ + board/searchList + .jsp
	
		return "goods/goodsList";
	}
	
	// adminList 관리자 상품 조회 리스트
		@RequestMapping("/goods/adminList.ad")
		public String adminGoodsList(SearchCriteria cri, Model model) throws Exception {
			model.addAttribute("adminList", goodsService.adminList(cri));
			PageMaker pageMaker = new PageMaker();
			// pageMaker 입력해야할 순서 cri -> totalCount(DAO)
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(goodsService.listCount(cri));
			System.out.println(pageMaker);
			model.addAttribute("pageMaker", pageMaker);
			// /WEB-INF/views/ + image/list + .jsp
			return "goods/adminList";
		}

	// 글보기
		@RequestMapping("/goods/view.do")
		public String view(int goods_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
				throws Exception {
			System.out.println("상품 상세보기"+goods_no);
			try {
				model.addAttribute("goods", goodsService.view(goods_no));
				System.out.println("값이 잘 넘어온다.");
				return "goods/view";
			} catch (Exception e) {
				System.out.println("글보기 예외 발생: goods_no-"+ goods_no);
				throw new Exception("예외발생함");
			}
		}
		
		//글 쓰기
		
		//글 수정 - get 
		
		//글 수정 - post

		//글 삭제
		@RequestMapping("/goods/adminDelete.ad")
		public String delete(int goods_no, Model model,RedirectAttributes rttr) throws Exception{
			
			return null;
		}


}
