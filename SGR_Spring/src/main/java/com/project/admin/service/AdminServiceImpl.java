package com.project.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.admin.dao.AdminDao;
import com.project.common.model.AdminCriteria;
import com.project.common.model.SearchCriteria;
import com.project.member.dto.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDao adminDao;
	
	@Override
	public List<MemberDto> listAll() throws Exception {
		// 회원 리스트 보기
		return adminDao.listAll();
	}

	@Override
	public List<MemberDto> listCriteria(SearchCriteria cri) throws Exception {
		// 회원 리스트 보기(Criteria)
		return adminDao.listCriteria(cri);
	}
	@Override
	public int listCountCriteria(SearchCriteria cri) throws Exception {
		// 회원 리스트 보기(paging)
		return adminDao.countPaging(cri);
	}
	
	@Override
	public List<MemberDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		// 검색 페이징 리스트 보기
		return adminDao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// 검색 페이징 리스트 보기(count)
		return adminDao.listSearchCount(cri);
	}
	
	@Override
	public MemberDto listDetail(Integer mb_no) throws Exception {
		// 회원 리스트 상세 보기 
		return adminDao.listDetail(mb_no);
	}

	@Override
	public void memberDrop(Integer mb_no) throws Exception {
		// 회원 강제 탈퇴(등급 변경)
		adminDao.memberDrop(mb_no);
	}

}
