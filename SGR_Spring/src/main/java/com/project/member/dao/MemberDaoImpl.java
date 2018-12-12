package com.project.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.dto.MemberDto;
@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession session;
	// nameSpace
	private final String NAMESPACE = "com.project.mapper.MemberMapper";
	
	@Override
	public MemberDto login(String mb_id, String mb_pw) throws Exception {
		// 로그인
		Map<String, Object> map = new HashMap<>();
		map.put("mb_id", mb_id);
		map.put("mb_pw", mb_pw);
		return session.selectOne(NAMESPACE+".login", map);
	}

	@Override
	public void changePw(String mb_id, String mb_pw) throws Exception {
		// 비밀번호 변경

	}

	@Override
	public MemberDto searchId(String mb_name, String mb_email) throws Exception {
		// 아이디 찾기
		return null;
	}

	@Override
	public MemberDto searchPw(String mb_id, String mb_name, String mb_email) throws Exception {
		// 비밀번호 찾기
		return null;
	}

	@Override
	public void join(MemberDto memberDto) throws Exception {
		// 회원가입
		session.insert(NAMESPACE+".join", memberDto);
	}

	@Override
	public void leave(String mb_id) throws Exception {
		// 회원탈퇴

	}

	@Override
	public MemberDto view(String mb_id) throws Exception {
		// 내 정보보기
		return null;
	}

	@Override
	public void update(MemberDto memberDto) throws Exception {
		// 내 정보수정

	}

}
