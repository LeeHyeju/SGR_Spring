package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.Criteria;
import com.project.dto.QnaReplyDto;

@Repository
public class QnaReplyDao {

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE = "com.project.mapper.QnaReplyMapper";
	
	public List<QnaReplyDto> list(Integer qna_no) throws Exception{
		//댓글 리스트
	return session.selectList(NAMESPACE+".list", qna_no);
	}
	
	public void create(QnaReplyDto qnaReplyDto) throws Exception {
		//댓글 쓰기
		session.insert(NAMESPACE+".create", qnaReplyDto);
	}

	public void update(QnaReplyDto qnaReplyDto)throws Exception{
		//댓글 수정
		session.update(NAMESPACE+".update", qnaReplyDto);
	}
	
	public void delete(Integer rno) throws Exception{
		//댓글 삭제
		session.delete(NAMESPACE+".delete", rno);
	}
	
	//페이징처리 된 리스트
	public List<QnaReplyDto> listPage(Integer qna_no, Criteria cri) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("qna_no", qna_no);
		paramMap.put("cri", cri);
		return session.selectList(NAMESPACE+".listPage", paramMap);
	}

	public int count(Integer qna_no) throws Exception{
		return session.selectOne(NAMESPACE+".count", qna_no);
	}
	
	public int getQno(Integer rno) throws Exception {
		//rno 가져오기
		return session.selectOne(NAMESPACE+".getQno", rno);
	}
}