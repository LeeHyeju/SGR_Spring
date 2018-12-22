package com.project.admin.dao;

import java.util.List;

import com.project.common.model.AdminCriteria;
import com.project.common.model.SearchCriteria;
import com.project.member.dto.MemberDto;

public interface AdminDao {

	// 회원 리스트 보기
	public List<MemberDto> listAll() throws Exception;

	// 회원 리스트 보기(페이지)
	public List<MemberDto> listPage(int page) throws Exception;

	// 회원 리스트 보기(Criteria)
	public List<MemberDto> listCriteria(SearchCriteria cri) throws Exception;

	// 검색이 있는 회원리스트
	public List<MemberDto> listSearch(SearchCriteria cri) throws Exception;

	//검색이 있는 회원리스트 (count)
	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 회원 리스트 보기(Paging)
	public int countPaging(SearchCriteria cri) throws Exception;

	// 회원 리스트 상세 보기
	public MemberDto listDetail(Integer mb_no) throws Exception;

	// 회원 강제 탈퇴(회원 등급 변경)
	public void memberDrop(Integer mb_no) throws Exception;

}
