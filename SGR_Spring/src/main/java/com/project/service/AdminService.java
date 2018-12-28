package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.common.model.AdminCriteria;
import com.project.common.model.SearchCriteria;
import com.project.dao.AdminDao;
import com.project.dto.MemberDto;

@Service
public class AdminService {

	@Inject
	private AdminDao adminDao;
	

	public List<MemberDto> listAll() throws Exception {
		// 회원 리스트 보기
		return adminDao.listAll();
	}


	public List<MemberDto> listCriteria(SearchCriteria cri) throws Exception {
		// 회원 리스트 보기(Criteria)
		return adminDao.listCriteria(cri);
	}

	public int listCountCriteria(SearchCriteria cri) throws Exception {
		// 회원 리스트 보기(paging)
		return adminDao.countPaging(cri);
	}
	

	public List<MemberDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		// 검색 페이징 리스트 보기
		return adminDao.listSearch(cri);
	}


	public int listSearchCount(SearchCriteria cri) throws Exception {
		// 검색 페이징 리스트 보기(count)
		return adminDao.listSearchCount(cri);
	}
	
	
	public MemberDto listDetail(String mb_id) throws Exception {
		// 회원 리스트 상세 보기 
		return adminDao.listDetail(mb_id);
	}


	public void memberDrop(String mb_id) throws Exception {
		// 회원 강제 탈퇴(등급 변경)
		adminDao.memberDrop(mb_id);
	}

}
