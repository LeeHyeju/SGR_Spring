package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.AdminCriteria;
import com.project.common.model.SearchCriteria;
import com.project.dto.MemberDto;

@Repository
public class AdminDao {

	@Inject
	private SqlSession session;

	// NAMESPACE
	private final String NAMESPACE = "com.project.mapper.AdminMapper";


	public List<MemberDto> listAll() throws Exception {
		// 회원 리스트 보기
		return session.selectList(NAMESPACE+".listAll");
	}


	public List<MemberDto> listPage(int page) throws Exception {
		// 회원 리스트 보기(페이지)
		if(page <= 0) {
			page = 1;
		}
		 page = (page - 1) * 10;
		 
		return session.selectList(NAMESPACE+".listPage", page);
	}
	

	public List<MemberDto> listCriteria(SearchCriteria cri) throws Exception {
		// 회원리스트 보기(Criteria)
		return session.selectList(NAMESPACE+".listCriteria", cri);
	}
	

	public int countPaging(SearchCriteria cri) throws Exception {
		// 회원 리스트 보기(Paging)
		return session.selectOne(NAMESPACE+".countPaging", cri);
	}


	public List<MemberDto> listSearch(SearchCriteria cri) throws Exception {
		// 검색이 있는 페이징 리스트
		return session.selectList(NAMESPACE+".listSearch", cri);
	}


	public int listSearchCount(SearchCriteria cri) throws Exception {
		// 검색이 있는 페이징 리스트(Count)
		return session.selectOne(NAMESPACE+".listSearchCount", cri);
	}
	

	public MemberDto listDetail(String mb_id) throws Exception {
		// 회원리스트 상세보기
		return session.selectOne(NAMESPACE+".listDetail", mb_id);
	}


	public void memberDrop(String mb_id) throws Exception {
		// 회원 강제 탈퇴(등급 변경)
		session.update(NAMESPACE+".memberDrop", mb_id);
	}

}
