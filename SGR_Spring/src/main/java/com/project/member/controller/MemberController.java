package com.project.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.member.dto.MemberDto;
import com.project.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	// 회원가입 창
		@RequestMapping(value="/join.do", method=RequestMethod.GET)
		public String joinForm() throws Exception{
			System.out.println("회원가입 창 join.do-get");
			return "member/join";
		}
		
	// 회원가입 처리
		@RequestMapping(value="/join.do", method=RequestMethod.POST)
		public String joinProcess(MemberDto memberDto, RedirectAttributes rttr) throws Exception{
			System.out.println("회원가입 처리 join.do-post");
			System.out.println("memberController.joinProcess().memberDto:" + memberDto);
			memberService.join(memberDto);
			
			rttr.addFlashAttribute("message", "check");
			
			return "redirect:/member/list.do";
		}	
		
		//로그인
		@RequestMapping(value="/login.do", method=RequestMethod.GET)
		public String loginForm() throws Exception{
			System.out.println("로그인 창 login.do-get");
			return "member/login";
		}
		
		
		 // 로그인 처리
		  @RequestMapping(value = "/login.do", method = RequestMethod.POST)
		  public String loginProcess(MemberDto memberDto, HttpSession session, RedirectAttributes rttr)
				  throws Exception {
			  System.out.println(memberDto);
			  // 가져온 정보를 세션에 담는다. --> 로그인 처리
			  session.setAttribute("login",
					  memberService.login(memberDto.getMb_id(), memberDto.getMb_pw()));
			  
			  // 메인 페이지로 돌아간다.
			  String goURI = (String)session.getAttribute("goURI");
			  System.out.println("admin : " + memberDto.getMb_id());
			  
			  MemberDto mbDto =  memberService.login(memberDto.getMb_id(), memberDto.getMb_pw());
			  System.out.println("서비스에 담았다");
			  if(mbDto != null){
				  System.out.println("성공");
				  System.out.println("아이디는?"+ mbDto.getMb_id());
				  return "redirect:/list.do";
				  
			  }else {
				  System.out.println("실패1 ");
				  rttr.addFlashAttribute("message", "fail");
				  return "redirect:/list.do";
			}
		  }
			 

}
