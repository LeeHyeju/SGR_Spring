package com.project.member.service;

import com.project.member.dto.MemberDto;

public interface MemberService {

	// 로그인
	public MemberDto login(String mb_id, String mb_pw) throws Exception;

	// 비밀번호 변경
	public void changePw(String mb_id, String mb_pw) throws Exception;

	// 아이디 찾기
	public MemberDto searchId(String mb_name, String mb_email) throws Exception;

	// 비밀번호 찾기
	public MemberDto searchPw(String mb_id, String mb_name, String mb_email) throws Exception;

	// 회원가입
	public void join(MemberDto memberDto) throws Exception;

	// 회원탈퇴
	public void leave(String mb_id) throws Exception;

	// 내 정보보기
	public MemberDto view(String mb_id) throws Exception;

	// 내 정보수정
	public void update(MemberDto memberDto) throws Exception;

}
