package com.project.admin.service;

import java.util.List;

import com.project.common.model.AdminCriteria;
import com.project.common.model.SearchCriteria;
import com.project.member.dto.MemberDto;

public interface AdminService {

	// 회원 리스트 보기
	public List<MemberDto> listAll() throws Exception;

	// 회원 리스트 보기(Criteria)
	public List<MemberDto> listCriteria(SearchCriteria cri) throws Exception;

	// 회원 리스트 보기(Criteria)
	public int listCountCriteria(SearchCriteria cri) throws Exception;
	
	// 검색 페이징 리스트 보기
	public List<MemberDto> listSearchCriteria(SearchCriteria cri) throws Exception;

	// 검색 페이징 리스트 보기(count)
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	// 회원 리스트 상세 보기
	public MemberDto listDetail(Integer mb_no) throws Exception;

	// 회원 강제 탈퇴(회원 등급 변경)
	public void memberDrop(Integer mb_no) throws Exception;


}
