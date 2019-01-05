package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.model.PageMaker;
import com.project.common.model.SearchCriteria;
import com.project.dto.GoodsDto;
import com.project.service.CategoryService;
import com.project.service.GoodsService;

@Controller
public class GoodsController {

	@Inject
	private GoodsService goodsService;
	@Inject
	private CategoryService cateGoryService;
	
	// 회원 상품 조회 리스트
	@RequestMapping(value = "/goods/goodsList.do", method = RequestMethod.GET)
	public String goodsList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		System.out.println("회원 상품 리스트-get");
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
			System.out.println("관리자 상품 리스트");
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

	// 상품 보기
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
		
		//상품 입력 - get
		@ResponseBody
		@RequestMapping(value="/goods/adminWrite.ad", method=RequestMethod.GET)
		public String adminWrite(Model model, HttpServletRequest req)throws Exception {
			System.out.println("관리자 상품 작성 - get입니다");
			
			String cate_nm = req.getParameter("cate_nm");
			
			
			//카테고리 대분류 코드
			model.addAttribute("depthOne", cateGoryService.depthOne());
			//소분류 코드
			model.addAttribute("depthTwo", cateGoryService.depthTwo(cate_nm));
			
			model.addAttribute("category", cateGoryService.listString()); 
						
			return "/goods/adminWrite";
		}
		//상품 입력 - post
		@RequestMapping(value="/goods/adminWrite.ad", method=RequestMethod.POST)
		public String adminWriteProcess(GoodsDto goodsDto, Model model,RedirectAttributes rttr)throws Exception {
			System.out.println("관리자 상품 작성 - post입니다");
			System.out.println("goodsController.dto:" +goodsDto.toString());
			goodsService.adminWrite(goodsDto);
			rttr.addFlashAttribute("msg", "writeOK");
			return "redirect:/goods/adminList.ad";
		}
		//상품 수정 - get 
		@RequestMapping(value = "/goods/adminUpdate.ad", method = RequestMethod.GET)
		public void adminUpdate(int goods_no, Model model) throws Exception {
			System.out.println("관리자 상품 수정 - Get");
			System.out.println(goods_no);
			model.addAttribute("adminList",goodsService.view(goods_no));
		}
		//상품 수정 - post
		@RequestMapping(value = "/goods/adminUpdate.ad", method = RequestMethod.POST)
		public String adminUpdateProcess(GoodsDto goodsDto,RedirectAttributes rttr) throws Exception {
			System.out.println("관리자 상품  수정 - Post");
			System.out.println("GoodsController.dto:"+ goodsDto.toString());
			goodsService.adminUpdate(goodsDto);
			rttr.addFlashAttribute("msg", "updateOK");
			return "redirect:/goods/adminList.ad";
		}
		//상품 삭제
		@RequestMapping(value="/goods/adminDelete.ad", method=RequestMethod.POST)
		public String delete(int goods_no, Model model,RedirectAttributes rttr) throws Exception{
			System.out.println("상품 삭제- post");
			goodsService.adminDelete(goods_no);
			rttr.addFlashAttribute("msg", "deleteOK");
			return "redirect:/goods/adminList.ad";
		}


}
