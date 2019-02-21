package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.SearchCriteria;
import com.project.dto.ReviewDto;

@Repository
public class ReviewDao {

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE = "com.project.mapper.ReviewMapper";
	
	public List<ReviewDto> reviewList(SearchCriteria cri) throws Exception{
		//리뷰 리스트
		return session.selectList(NAMESPACE+".reviewList", cri);
	}
	
	public int reviewCount(SearchCriteria cri) throws Exception{
		//글 개수 세기
		return session.selectOne(NAMESPACE+".reviewCount", cri);
	}

	public ReviewDto view(Integer review_no) throws Exception{
		//글 보기
		
		return session.selectOne(NAMESPACE+".view", review_no);
	}
	
	public void hit(Integer review_no) throws Exception{
		//글 조회수 
		session.update(NAMESPACE+".hit", review_no);
	}
	
	public void write(ReviewDto reviewDto) throws Exception{
		//글 쓰기
		session.insert(NAMESPACE+".write", reviewDto);
	}
	
	public void update(ReviewDto reviewDto) throws Exception{
		//글 수정
		session.update(NAMESPACE+".update", reviewDto);
	}
	
	public void delete(Integer review_no) throws Exception{
		//글 삭제
		session.delete(NAMESPACE+".delete", review_no);
	}
}
