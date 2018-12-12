package com.project.admin.dao;

import java.util.List;

import com.project.member.dto.MemberDto;

public interface AmdinDao {

	//회원 리스트 보기
	public List<MemberDto> list() throws Exception;
	
	//회원 리스트 상세 보기 
	public MemberDto listDetail(int mb_no) throws Exception;
	
	//회원 등급 변경
	public void gradeChange() throws Exception;
	
	//회원 강제 탈퇴
	public void memberDrop(int mb_no) throws Exception;
}
