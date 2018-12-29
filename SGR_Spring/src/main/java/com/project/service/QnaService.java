package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.common.model.SearchCriteria;
import com.project.dao.QnaDao;
import com.project.dto.QnaDto;

@Service
public class QnaService {

	@Inject
	private QnaDao qnaDao;

	// 관리자 화면
	public List<QnaDto> adminList(SearchCriteria cri) throws Exception {
		// 관리자 글 리스트
		return qnaDao.adminList(cri);
	}

	public void adminWrite(QnaDto qnaDto) throws Exception {
		// 글쓰기
		qnaDao.adminWrite(qnaDto);
	}

	// 회원 화면
	public List<QnaDto> qnaList(SearchCriteria cri) throws Exception {
		// 글 리스트
		return qnaDao.qnaList(cri);
	}

	public void write(QnaDto qnaDto) throws Exception {
		// 글쓰기
		qnaDao.write(qnaDto);
	}

	public void update(QnaDto qnaDto) throws Exception {
		// 글 수정
		qnaDao.update(qnaDto);
	}

	public void delete(Integer qna_no) throws Exception {
		// 글 삭제
		qnaDao.delete(qna_no);
	}

	// 공통
	public int qnaListCount(SearchCriteria cri) throws Exception {
		// 글 리스트 세기
		return qnaDao.qnaListCount(cri);
	}

	public QnaDto view(Integer qna_no) throws Exception {
		// 글보기
		return qnaDao.view(qna_no);
	}

}
