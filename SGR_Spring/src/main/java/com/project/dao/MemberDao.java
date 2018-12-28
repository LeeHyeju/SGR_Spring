package com.project.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDto;

@Repository
public class MemberDao {

	@Inject
	private SqlSession session;
	
	
	// nameSpace
	private final String NAMESPACE = "com.project.mapper.MemberMapper";


	public void join(MemberDto memberDto) throws Exception {
		// 회원가입
		session.insert(NAMESPACE + ".join", memberDto);
	}


	public int idcheck(String id) throws Exception {
		// 아이디 중복확인
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", id);
		return session.selectOne(NAMESPACE+".idCheck", map);
	}


	public MemberDto login(String mb_id, String mb_pw) throws Exception {
		// 로그인
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", mb_id);
		map.put("mb_pw", mb_pw);
		return session.selectOne(NAMESPACE + ".login", map);
	}

	
	public MemberDto update(String mb_id) throws Exception {
		// 내 정보 수정
		return session.selectOne(NAMESPACE + ".view", mb_id);
	}


	public void updateProcess(MemberDto memberDto) throws Exception {
		// 내 정보수정 처리
		session.update(NAMESPACE + ".updateProcess", memberDto);
	}


	public boolean pwCheck(String mb_id, String mb_pw) throws Exception {
		// 정보 수정 시 비밀번호 확인
		boolean result = false;
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", mb_id);
		map.put("mb_pw", mb_pw);
		int count = session.selectOne(NAMESPACE+".pwCheck", map);
		if(count == 1) result = true;
		return result;
	}


	public void changePw(String mb_id, String mb_pw) throws Exception {
		// 비밀번호 변경
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", mb_id);
		map.put("mb_pw", mb_pw);
		session.update(NAMESPACE+".changePw", map);
	}


	public MemberDto searchId(String mb_name, String mb_email) throws Exception {
		// 아이디 찾기
		Map<String, Object> map = new HashMap<>();
		map.put("mb_name", mb_name);
		map.put("mb_email", mb_email);
		return session.selectOne(NAMESPACE+".searchId", map);
	}


	public MemberDto searchPw(String mb_id, String mb_name, String mb_email) throws Exception {
		// 비밀번호 찾기
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", mb_id);
		map.put("mb_name", mb_name);
		map.put("mb_email", mb_email);
		return session.selectOne(NAMESPACE+".searchPw", map);
	}


	public void leave(String mb_id) throws Exception {
		// 회원탈퇴
		session.update(NAMESPACE+".leave", mb_id);
	}


	public MemberDto view(String mb_id) throws Exception {
		// 내 정보 보기
		return session.selectOne(NAMESPACE+".view", mb_id);
	}

}
