package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.common.model.Criteria;
import com.project.dao.QnaDao;
import com.project.dao.QnaReplyDao;
import com.project.dto.QnaReplyDto;

@Service
public class QnaReplyService {

	@Inject
	private  QnaReplyDao qnaReplyDao;
	
	@Inject
	private QnaDao qnaDao;
	
	
	public List<QnaReplyDto> list(Integer qna_no) throws Exception{
		//댓글 리스트
		return qnaReplyDao.list(qna_no);
	}
	
	@Transactional
	public void create(QnaReplyDto qnaReplyDto) throws Exception {
		//댓글 쓰기
		qnaReplyDao.create(qnaReplyDto);
		qnaDao.updateReplyCnt(qnaReplyDto.getQna_no(), 1);
	}

	public void update(QnaReplyDto qnaReplyDto)throws Exception{
		//댓글 수정
		qnaReplyDao.update(qnaReplyDto);
	}
	
	@Transactional
	public void delete(Integer rno) throws Exception{
		//댓글 삭제
		int qna_no = qnaReplyDao.getQno(rno);
		qnaReplyDao.delete(rno);
		qnaDao.updateReplyCnt(qna_no, -1);
	}
	
	//페이징처리 된 리스트
	public List<QnaReplyDto> listPage(Integer qna_no, Criteria cri) throws Exception{
			
		return qnaReplyDao.listPage(qna_no, cri);
	}

	public int count(Integer qna_no) throws Exception{
		return qnaReplyDao.count(qna_no);
	}
	
}
