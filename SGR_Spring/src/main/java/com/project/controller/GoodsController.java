package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
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
	
	
	/**
	 * 회원 상품조회 리스트
	 * 작성자 : 이혜주
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * adminList 관리자 상품 조회 리스트
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
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

	/**
	 * 상품 보기
	 * @param goods_no
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
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
		
		/**
		 * 상품 입력 GET
		 * @param model
		 * @param req
		 * @param cateGory1
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/goods/adminWrite.ad", method=RequestMethod.GET)
		public String adminWrite(Model model, HttpServletRequest req,@RequestParam Map<String,Object> cateGory1)
			throws Exception {
			System.out.println("관리자 상품 작성 - get입니다");
		
			//카테고리 대분류 코드	
			model.addAttribute("depthOne", cateGoryService.depthOne());
			
			return "/goods/adminWrite";
		}
		
//		@RequestMapping(value="/goods/adminWrite.ad", method=RequestMethod.GET)
//		public ModelAndView adminWrite(Model model, HttpServletRequest req,@RequestParam Map<String,Object> cateGory1)throws Exception {
//			System.out.println("관리자 상품 작성 - get입니다");
//			
//			String cate_nm = req.getParameter("cate_nm");
//			
//			//카테고리 대분류 코드	
//			model.addAttribute("depthOne", cateGoryService.depthOne());
//			//소분류 코드
//			model.addAttribute("depthTwo", cateGoryService.depthTwo(cateGory1));
//			System.out.println("카테고리 ㅇㅇ");	
//			
//			ModelAndView mv = new ModelAndView();
//			
//			return mv;
//		}
		/**
		 * 상품 등록 시 카테고리 받아오기
		 * 이혜주
		 * @param model
		 * @param cateGory1
		 * @return
		 * @throws Exception
		 */
		
		@RequestMapping(value = "goods/category.ad", method=RequestMethod.POST) //포스트 방식으로 받는다.
		@ResponseBody
		public  HashMap<String, Object> testJson( ModelMap model, HttpServletRequest req) throws Exception {
			
		    HashMap<String, Object> hashmap = new HashMap<String, Object>(); //HashMap을 이용해서 던져줌		    
		    String cateGory1 = req.getParameter("cateGory1");
	    
		    List resultList = cateGoryService.depthOne();// 서비스를 호출하여 쿼리 리스트를 담는다.
		    List cateGory2 =  cateGoryService.depthTwo(cateGory1);
		    hashmap.put("data", resultList); // 받아온 쿼리 리스트를 hashmap data에 담는다.
		    hashmap.put("cateGory2", cateGory2);
		    hashmap.put("msg", "success"); //  문자열을 hashmap msg에 담는다.
		   System.out.println("카테고리 끝");
		    return hashmap; // 화면으로 던져준다!!
		}
		
		
		
		/**
		 * 상품입력 POST
		 * @param goodsDto
		 * @param model
		 * @param rttr
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/goods/adminWriteProcess.ad", method=RequestMethod.POST)
		public String adminWriteProcess(GoodsDto goodsDto,Model model,  RedirectAttributes rttr, HttpServletRequest req)throws Exception {
			System.out.println("관리자 상품 작성 - post입니다");
		
//			String uploadFile = goodsDto.getGoods_img();
			//db에 저장
//			goodsService.adminWrite(goodsDto);
			rttr.addFlashAttribute("msg", "writeOK");
			return "redirect:/goods/adminList.ad";
			}
	
		public String upload(GoodsDto goodsDto, RedirectAttributes rttr)	throws Exception {
			System.out.println(goodsDto);
			// 서버에 저장된 이미지 파일을 가져온다. file1~ file6번까지 (file1 : 썸네일,큰이미지, file2~6(detail.jsp) : 서브 이미지
			MultipartFile uploadFile = goodsDto.getGoods_img();

			System.out.println("Upload file 넘기는곳 뒤");
			// 첨부 파일이 없는 경우 업로드 시키지 않고 글쓰기 화면으로 돌아감
			System.out.println("+++++++++++++++++++++++++++++++++");
			System.out.println("uploadfile : " + uploadFile);
			if (uploadFile.getSize() == 0) {
				return "goods/adminWrite";
			}

			// 첨부 파일을 업로드하고 리사이즈 해서 저장하는 것을 호출하면 s_ 가 붙은 파일명을 file1에 넣는다.
			// 서버에 저장된 이미지 파일을 가져온다. file1~ file6번까지 (file1 : 썸네일,큰이미지, file2~6(detail.jsp) : 서브 이미지
	
			
			return "redirect:adminList.go";
		}
		
		/**
		 * 상품수정 GET
		 * @param goods_no
		 * @param model
		 * @throws Exception
		 */
		@RequestMapping(value = "/goods/adminUpdate.ad", method = RequestMethod.GET)
		public void adminUpdate(int goods_no, Model model) throws Exception {
			System.out.println("관리자 상품 수정 - Get");
			System.out.println(goods_no);
			model.addAttribute("adminList",goodsService.view(goods_no));
		}
		
		
		/**
		 * 상품수정 POST
		 * @param goodsDto
		 * @param rttr
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/goods/adminUpdate.ad", method = RequestMethod.POST)
		public String adminUpdateProcess(GoodsDto goodsDto,RedirectAttributes rttr) throws Exception {
			System.out.println("관리자 상품  수정 - Post");
			System.out.println("GoodsController.dto:"+ goodsDto.toString());
			goodsService.adminUpdate(goodsDto);
			rttr.addFlashAttribute("msg", "updateOK");
			return "redirect:/goods/adminList.ad";
		}
		
		
		/**
		 * 상품삭제 POST
		 * @param goods_no
		 * @param model
		 * @param rttr
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/goods/adminDelete.ad", method=RequestMethod.POST)
		public String delete(int goods_no, Model model,RedirectAttributes rttr) throws Exception{
			System.out.println("상품 삭제- post");
			goodsService.adminDelete(goods_no);
			rttr.addFlashAttribute("msg", "deleteOK");
			return "redirect:/goods/adminList.ad";
		}


}
