package com.project.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDao;
import com.project.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDao memberDao;
	
	@Override
	public MemberDto login(String mb_id, String mb_pw) throws Exception {
		// 로그인
		return memberDao.login(mb_id, mb_pw);
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
		memberDao.join(memberDto);
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
