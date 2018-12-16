package com.project.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.member.dto.MemberDto;


public class SgrInterceptor extends HandlerInterceptorAdapter {
	// Map<URI, 페이지 권한>
	// 페이지 권한 : 0-관리자 6-로그인 9--탈퇴회원
	static private Map<String, Integer> admin = new HashMap<>();

	// 초기화 블록 - 바로 실행됨.
	static {

		// 회원 정보 수정, 탈퇴 
		admin.put("/member/update.do", 6);
		admin.put("/member/pwCheck.do", 6);
		admin.put("/member/changePw.do", 6);
		admin.put("/member/memberChangePw.do", 6);
		admin.put("/member/leave.do", 6);
		admin.put("/member/view.do", 6);

		// admin - 1(관리자 권한이 있어야 한다.)
		admin.put("/admin/list.ad", 0);
		admin.put("/admin/listDetail.ad", 0);
		admin.put("/admin/drop.ad", 0);


		// goods - admin
		admin.put("/goods/adminList.go", 0);
		admin.put("/goods/adminWrite.go", 0);
		admin.put("/goods/adminUpdate.go", 0);
		admin.put("/goods/adminDelete.go", 0);


	}

	@Override
	// controller를 실행하기 전에 이 메소드가 실행이 됩니다.
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("SgrInterceptor.preHandle()");

		HttpSession session = request.getSession();

		String uri = request.getServletPath();
		Integer uriGrade = admin.get(uri);
		System.out.println(uri);

		System.out.println(
				"==============================================================================================");
		System.out.println(
				"==============================================================================================");
		// 로그인이 필요한 경우 로그인을 시킨다.
		if (uriGrade != null) {
			System.out.println("로그인받아옴");
			// 로그인 정보를 받아 온다.
			MemberDto memberDto = (MemberDto)session.getAttribute("login");
			// 로그인이 안되어 있는 경우
			if (memberDto == null) {
				System.out.println("로그인 하세요");
				// 로그인 처리하기 전에 URI 저장
				session.setAttribute("goURI", ".." + uri);
				// 로그인 처리 화면으로 간다.
				response.sendRedirect("../member/login.do");
				// 요청한 URI을 실행하지 않게 한다.
				return false;
			}
			// 로그인은 되어 있으나 권한이 없는 경우 처리
			if (memberDto.getMb_grade() > uriGrade) {
				System.out.println("권한이 없는 페이지입니다.");
				// 권한 없음 페이지로 이동
				response.sendRedirect("../error/noPermission.do");
				// 요청한 URI을 실행하지 않게 한다.
				return false;
			}
		}
		// 요청한 URI을 실행하게 한다.
		System.out.println("하이패스");
		return true;
	}
}
