package com.project.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.CategoryDto;
import com.project.service.CategoryService;

@Controller
//@RequestMapping("/category/*")
public class CategoryController {

	@Inject
	private CategoryService categoryService;
	
	// 카테고리 보기
	@RequestMapping(value = "/category/cateList.ad", method = RequestMethod.GET)
	public String list(CategoryDto categoryDto, Model model) throws Exception {
		System.out.println("카테고리 보기 - Get");
		List<CategoryDto> list = categoryService.list(); //<<- list에 담고 list리턴
//		List<Map<String, Object>> listMap = categoryService.readListMap(); 
//		Map<String, Object> listSelect = categoryService.readListType(); 
		System.out.println("cateList=-===================================="+list);
		model.addAttribute("list",list);
					
		return "category/cateList";
	}

	// 카테고리 보기
			@RequestMapping(value = "/category/read.ad", method = RequestMethod.GET)
			public String read(String catesub_cd, Model model) throws Exception {
				System.out.println("카테고리 보기 - Get");
				model.addAttribute("list",categoryService.read(catesub_cd));							
				return "category/read";
			}
			
	//카테고리 만들기
	@RequestMapping(value = "/category/create.ad", method = RequestMethod.GET)
	public void create() throws Exception{
		System.out.println("카테고리 만들기 - get창입니다");
	}
	
	//카테고리 만들기
	@RequestMapping(value = "/category/create.ad", method = RequestMethod.POST)
	public String createProcess(CategoryDto categoryDto, RedirectAttributes rttr) throws Exception{
		System.out.println("카테고리 만들기 - post 창입니다");
		System.out.println("CategoryController.dto:"+ categoryDto);
		categoryService.create(categoryDto);
		rttr.addFlashAttribute("msg","createOK");
			return "redirect:/category/cateList.ad";
	}
	
		// 카테고리 수정 
		@RequestMapping(value = "/category/update.ad", method = RequestMethod.GET)
		public void update(String catesub_cd, Model model) throws Exception {
			System.out.println("카테고리 수정 - Get");
			System.out.println(catesub_cd);
			model.addAttribute("list",categoryService.read(catesub_cd));
		}
	
		// 카테고리 수정 처리
		@RequestMapping(value = "/category/update.ad", method = RequestMethod.POST)
		public String updateProcess(CategoryDto categoryDto,RedirectAttributes rttr) throws Exception {
			System.out.println("카테고리 수정 - Post");
			System.out.println("CategoryController.dto:"+ categoryDto.toString());
			categoryService.update(categoryDto);
			rttr.addFlashAttribute("msg", "updateOK");
			return "redirect: ../category/cateList.ad";
		}
		
		// 카테고리 삭제
		@RequestMapping(value = "/category/delete.ad", method = RequestMethod.POST)
		public String delete(String catesub_cd, RedirectAttributes rttr) throws Exception {
			System.out.println("카테고리 삭제 - Post");
			categoryService.delete(catesub_cd);
			rttr.addFlashAttribute("msg", "deleteOK");
			return "redirect: ../category/cateList.ad";
		}
}
