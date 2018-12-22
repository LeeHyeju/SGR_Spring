package com.project.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDao;
import com.project.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDao memberDao;
	//@Inject
	//private MemberMapper memberMapper;

	@Override
	public void join(MemberDto memberDto) throws Exception {
		// 회원가입
		memberDao.join(memberDto);
	}

	@Override
	public int idcheck(String id) throws Exception {
		// 아이디 중복 체크
		return memberDao.idcheck(id);
	}

	@Override
	public MemberDto login(String mb_id, String mb_pw) throws Exception {
		// 로그인
		return memberDao.login(mb_id, mb_pw);
	}

	@Override
	public MemberDto update(String mb_id) throws Exception {
		// 내 정보보기
		return memberDao.update(mb_id);
	}

	@Override
	public void updateProcess(MemberDto memberDto) throws Exception {
		// 내 정보수정
		System.out.println("업데이트 프로세스 서비스");
		//memberMapper.updateProcess(memberDto);
		memberDao.updateProcess(memberDto);
	}

	@Override
	public boolean pwCheck(String mb_id, String mb_pw) throws Exception {
		// 정보 수정 시 비밀번호 확인
		return memberDao.pwCheck(mb_id, mb_pw);
	}

	@Override
	public void changePw(String mb_id, String mb_pw) throws Exception {
		// 비밀번호 변경
		memberDao.changePw(mb_id, mb_pw);
	}

	@Override
	public MemberDto searchId(String mb_name, String mb_email) throws Exception {
		// 아이디 찾기
		return memberDao.searchId(mb_name, mb_email);
	}

	@Override
	
	public MemberDto searchPw(String mb_id, String mb_name, String mb_email) throws Exception {
		// 비밀번호 찾기
		return memberDao.searchPw(mb_id, mb_name, mb_email);
	}

	@Override
	public void leave(String mb_id) throws Exception {
		// 회원탈퇴
		memberDao.leave(mb_id);
	}

	@Override
	public MemberDto view(String mb_id) throws Exception {
		// 내 정보 보기
		return memberDao.view(mb_id);
	}

}
