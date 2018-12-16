package com.project.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.email.Email;
import com.project.email.EmailSender;
import com.project.member.dto.MemberDto;
import com.project.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private MemberService memberService;

	@Inject
	private Email email;

	@Inject
	private EmailSender emailSender;
	

	// 회원가입 창
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm() throws Exception {
		System.out.println("회원가입 창 join.do-get");
		return "member/join";
	}

	// 회원가입 처리
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinProcess(MemberDto memberDto, RedirectAttributes rttr) throws Exception {
		System.out.println("회원가입 처리 join.do-post");
		System.out.println("memberController.joinProcess().memberDto:" + memberDto);
		memberService.join(memberDto);

		rttr.addFlashAttribute("message", "check");

		return "redirect:../main/main.do";
	}

	// id 중복확인
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String idcheck(String id) throws Exception {
		System.out.println("MemberController.idcheck().id:" + id);
		int result = memberService.idcheck(id);
		System.out.println("resultCnt : " + result);
		String resultMsg = "";
		if (result == 0) {
			resultMsg = "OK";
		} else {
			resultMsg = "NOT";
		}
		return resultMsg;
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		System.out.println("로그인 창 login.do-get");
		return "member/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProcess(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println(memberDto);
		// 가져온 정보를 세션에 담는다. --> 로그인 처리
		session.setAttribute("login", memberService.login(memberDto.getMb_id(), memberDto.getMb_pw()));

		// 메인 페이지로 돌아간다.
		String goURI = (String) session.getAttribute("goURI");
		System.out.println("admin : " + memberDto.getMb_id());

		MemberDto mbDto = memberService.login(memberDto.getMb_id(), memberDto.getMb_pw());
		System.out.println("서비스에서 id, pw를 dto에 담음");
		if (mbDto != null) {
			System.out.println("성공");
			System.out.println("아이디는?" + mbDto.getMb_id());
			return "redirect:../main/main.do";
			// 메인 화면 만들면 그때 !!

		} else {
			System.out.println("실패");
			rttr.addFlashAttribute("message", "fail");
			return "redirect:../member/login.do";
		}
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("MemberController.logout()");
		session.invalidate();
		// main으로 리턴
		return "redirect:../main/main.do";
	}

	// 내 정보 보기
	@RequestMapping("/view.do")
	public String view(Model model, HttpSession session, String mb_id) throws Exception {
		System.out.println("내 정보 보기 ");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memberService.update(memberDto.getMb_id()));
		System.out.println("MemberController.update().mb_id:" + memberDto.getMb_id());
		return "member/view";
	}

	// 회원정보 수정
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session, String mb_id) throws Exception {
		System.out.println("회원 정보 수정 창update.do-get");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		model.addAttribute("member", memberService.update(memberDto.getMb_id()));
		System.out.println("MemberController.update().mb_id:" + memberDto.getMb_id());

		return "member/update";
	}

	// 회원 정보 수정 처리
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateProcess(MemberDto memberDto) throws Exception {
		System.out.println("회원 정보 수정 창 update.do-post");
		System.out.println("memberController.updateProcess().memberDto:" + memberDto.toString());
		memberService.updateProcess(memberDto);
		return "redirect:../member/view.do";
	}

	// 회원 정보 수정 시 비밀번호 확인
	@RequestMapping(value = "/pwCheck.do", method = RequestMethod.GET)
	public String pwdCheck() throws Exception {
		System.out.println("현재 비밀번호 입력 확인창 pwCheck.do ");
		return "member/pwCheck";
	}

	// 회원 정보 수정 시 비밀번호 확인 처리
	@RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
	public String pwCheckProcess(HttpSession session, String mb_id, String mb_pw, RedirectAttributes rttr)
			throws Exception {
		System.out.println("회원 정보 수정 시 비밀번호 확인 처리  pwCheck.do-post");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		MemberDto mem_pw = memberService.pwCheck(memberDto.getMb_id(), mb_pw);
		;
		System.out.println("내 아이디 :" + memberDto.getMb_id());
		System.out.println("입력받은 비밀번호 :" + mem_pw);
		if (mem_pw == null) {
			System.out.println("비밀번호 오류");
			rttr.addFlashAttribute("message", "fail");
			return "redirect:../member/pwCheck.do";
		}
		System.out.println("입력받은 비밀번호 :" + mem_pw.getMb_pw());
		System.out.println("DB상의 비밀번호 :" + mb_pw);
		rttr.addFlashAttribute("message", "success");
		System.out.println("비밀번호가 일치합니다. 변경으로 넘어갑니다.");

		return "../member/update.do";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changePw.do", method = RequestMethod.GET)
	public String changePw() throws Exception {
		System.out.println("비밀번호 변경 :  changePw.do-get");
		return "member/changePw";
	}

	// 비밀번호 변경 처리
	@RequestMapping(value = "/changePw.do", method = RequestMethod.POST)
	public String changePwProcess(HttpSession session, String mb_pw) throws Exception {
		System.out.println("비밀번호 변경 :  changePw.do-post");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		System.out.println("변경할 아이디:" + memberDto.getMb_id());
		System.out.println("변경할 비번:" + mb_pw);
		memberService.changePw(memberDto.getMb_id(), mb_pw);
		System.out.println("비밀번호 : " + mb_pw);
		System.out.println("비밀번호 변경 입력창 changePw.do");
		session.invalidate();
		// main으로 리턴
		return "redirect:../member/login.do";
	}

	// 아이디 찾기 창
	@RequestMapping(value = "/searchId.do", method = RequestMethod.GET)
	public String memberSearchId() throws Exception {
		System.out.println("아이디 찾기 창 memberSearchId.do ");
		return "member/searchId";
	}

	// 아이디 찾기 처리 창
	@RequestMapping("/searchIdResult.do")
	public String searchIdProcess(String mb_name, String mb_email, Model model, MemberDto memberDto,
			RedirectAttributes rttr) throws Exception {
		System.out.println("mb_name : " + mb_name);
		System.out.println("mb_email : " + mb_email);
		memberDto = memberService.searchId(mb_name, mb_email);

		if (memberDto != null) {
			System.out.println(memberDto.getMb_id());
			model.addAttribute("member", memberService.searchId(mb_name, mb_email));
			System.out.println("아이디 찾은 페이지 이동");
			rttr.addFlashAttribute("message", "checkId");
			rttr.addFlashAttribute("findId", "회원님의 아이디는  " + memberDto.getMb_id() + " 입니다.");
			return "redirect:../member/login.do";
		}
		System.out.println("아이디를 찾을 수 없습니다. 아이디와 이메일을 확인해주세요.");
		rttr.addFlashAttribute("message", "failId");
		return "redirect:../member/searchId.do";

	}

	// 비밀번호 찾기
	@RequestMapping(value = "/searchPw.do", method = RequestMethod.GET)
	public String memberSearchPw() throws Exception {
		System.out.println("비밀번호 찾기 : searchPw.do ");
		return "member/searchPw";
	}

	// 비밀번호 찾기 이메일
	@RequestMapping("/searchPwResult.do")
	 public String sendEmailAction (String mb_id, String mb_name, String mb_email, Model model, MemberDto memberDto,RedirectAttributes rttr)
	    		throws Exception {
	    		    	
	    	System.out.println("id : " + mb_id + " mb_name "+mb_name+" email : "+mb_email);
	    	System.out.println(memberService.searchPw(mb_id, mb_name, mb_email));
	    	memberDto = memberService.searchPw(mb_id, mb_name, mb_email);
	    	if(memberDto != null){
	    		System.out.println("비번 : "+memberDto.getMb_pw());
	    		email.setContent("비밀번호는 "+memberDto.getMb_pw()+" 입니다.");
	            email.setReceiver(mb_email);
	            email.setSubject(mb_id+"님의  비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            rttr.addFlashAttribute("message", "checkpw");
	    		return "redirect:../member/login.do";
	    	}
	    	rttr.addFlashAttribute("message", "failpw");
	    	System.out.println("아이디,비번,이메일이 맞지 않는다.");
	    	return "redirect:../member/searchPw.do";
	    }
	

	// 회원 탈퇴 여부 확인(탈퇴회원 등급 9로 변경)
	@RequestMapping(value = "/member/leave.do", method = RequestMethod.POST)
	public String leaveForm(HttpSession session) throws Exception {
		System.out.println("회원 탈퇴하시겠습니까?");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		System.out.println("탈퇴 아이디 있나? : " + memberDto.getMb_id());
		memberService.leave(memberDto.getMb_id());
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
