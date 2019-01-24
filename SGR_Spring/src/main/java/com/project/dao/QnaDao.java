package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.SearchCriteria;
import com.project.dto.CategoryDto;
import com.project.dto.QnaDto;

@Repository
public class QnaDao {

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE="com.project.mapper.QnaMapper";
	
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
	  
	  public void hit(Integer qna_no) throws Exception{
		  //조회수 증가
		  session.update(NAMESPACE+".hit", qna_no);
	  }
	  
	  //댓글 
	  public void updateReplyCnt(Integer qna_no, int amount) throws Exception {

		    Map<String, Object> paramMap = new HashMap<String, Object>();

		    paramMap.put("qna_no", qna_no);
		    paramMap.put("amount", amount);

		    session.update(NAMESPACE + ".updateReplyCnt", paramMap);
		  }
	  
	
	  public void updateViewCnt(Integer qna_no) throws Exception {
	    
	    session.update(NAMESPACE+".updateViewCnt", qna_no);
	    
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
