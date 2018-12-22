package com.project.category.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.category.dto.CategoryDto;
import com.project.category.service.CategoryService;

@Controller
@RequestMapping("/category/*")
public class CategoryController {

	@Inject
	private CategoryService categoryService;
	
	// 카테고리 보기
	@RequestMapping(value = "/catelist.ad", method = RequestMethod.GET)
	public String list(CategoryDto categoryDto, Model model) throws Exception {
		System.out.println("카테고리 보기 - Get");
		List<CategoryDto> list = categoryService.list(); //<<- list에 담고 list리턴
//		List<Map<String, Object>> listMap = categoryService.readListMap(); 
//		Map<String, Object> listSelect = categoryService.readListType(); 
		System.out.println("cateList=-===================================="+list);
		model.addAttribute("read",list);
					
		return "category/read";
	}

	
	
	
	//카테고리 만들기
	@RequestMapping(value = "/create.ad", method = RequestMethod.GET)
	public void create() throws Exception{
		System.out.println("카테고리 만들기 - get창입니다");
		
	}
	
	//카테고리 만들기
	@RequestMapping(value = "/create.ad", method = RequestMethod.POST)
	public String createProcess(CategoryDto categoryDto, RedirectAttributes rttr) throws Exception{
		System.out.println("카테고리 만들기 - post 창입니다");
		System.out.println("CategoryController.dto:"+ categoryDto);
		categoryService.create(categoryDto);
		rttr.addFlashAttribute("msg","createOK");
			return "redirect:/category/read.ad";
	}
	
	// 카테고리 보기
		@RequestMapping(value = "/read.ad", method = RequestMethod.GET)
		public String read(CategoryDto categoryDto, Model model) throws Exception {
			System.out.println("카테고리 보기 - Get");
//			List<CategoryDto> list = categoryService.read(); //<<- list에 담고 list리턴
//			List<Map<String, Object>> listMap = categoryService.readListMap(); 
//			Map<String, Object> listSelect = categoryService.readListType(); 
//			System.out.println("cateList=-===================================="+list);
//			model.addAttribute("read",list);
//						
			return "category/read";
		}
	
	
		// 카테고리 수정 
		@RequestMapping(value = "/update.ad", method = RequestMethod.GET)
		public void update(Model model) throws Exception {
			System.out.println("카테고리 수정 - Get");
//			model.addAttribute("category", categoryService.read());
		}
	
		// 카테고리 수정 처리
		@RequestMapping(value = "/updateProcess.ad", method = RequestMethod.GET)
		public String updateProcess(CategoryDto categoryDto,RedirectAttributes rttr) throws Exception {
			System.out.println("카테고리 수정 - Post");
			categoryService.update(categoryDto);
			rttr.addFlashAttribute("msg", "update");
		
			return "redirect: ../category/read.ad";
		}
		
		// 카테고리 삭제
		@RequestMapping(value = "/delete.ad", method = RequestMethod.GET)
		public String delete(int category_no, int categorySub_no,RedirectAttributes rttr) throws Exception {
			System.out.println("카테고리 삭제 - Get");
			categoryService.delete(category_no, categorySub_no);
			rttr.addFlashAttribute("msg", "remove");
			
			return "redirect: ../category/read.ad";
			
		}
	
}
