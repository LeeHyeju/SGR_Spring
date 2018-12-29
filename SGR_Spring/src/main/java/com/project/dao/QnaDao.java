package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.SearchCriteria;
import com.project.dto.QnaDto;

@Repository
public class QnaDao {

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE="com.project.mapper.QnaMapper";
	
	
	//관리자 화면
	  public List<QnaDto> adminList(SearchCriteria cri) throws Exception {
		  //관리자 글 리스트
		  return session.selectList(NAMESPACE + ".adminList", cri);
	  }
	  public void adminWrite(QnaDto qnaDto) throws Exception {
			//글쓰기
		    session.insert(NAMESPACE + ".write", qnaDto);
		  }
	
	//회원 화면 
	  public List<QnaDto> qnaList(SearchCriteria cri) throws Exception {
		  //글 리스트
	    return session.selectList(NAMESPACE + ".qnaList", cri);
	  }

	public void write(QnaDto qnaDto) throws Exception {
		//글쓰기
	    session.insert(NAMESPACE + ".write", qnaDto);
	  }

	  public void update(QnaDto qnaDto) throws Exception {
	    //글 수정
		  session.update(NAMESPACE + ".update", qnaDto);
	  }

	  public void delete(Integer qna_no) throws Exception {
	   //글 삭제
		  session.delete(NAMESPACE + ".delete", qna_no);
	  }
	  
		//공통
	  public int qnaListCount(SearchCriteria cri) throws Exception {
		  //글 리스트 세기
	    return session.selectOne(NAMESPACE + ".qnaListCount", cri);
	  }
	  public QnaDto view(Integer qna_no) throws Exception {
		    //글보기
			  return session.selectOne(NAMESPACE + ".view", qna_no);
		  }
	 
}
