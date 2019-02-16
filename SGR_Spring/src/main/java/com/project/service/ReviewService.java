package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.common.model.SearchCriteria;
import com.project.dao.ReviewDao;
import com.project.dto.ReviewDto;

@Service
public class ReviewService {

	@Inject
	private ReviewDao reviewDao;
	
	public List<ReviewDto> reviewList(SearchCriteria cri) throws Exception{
		//리뷰 리스트
		return reviewDao.reviewList(cri);
	}
	
	public int reviewCount(SearchCriteria cri) throws Exception{
		//글 개수 세기
		return reviewDao.reviewCount(cri);
	}
	
	public ReviewDto view(Integer review_no)throws Exception{
		//글보기
		  return reviewDao.view(review_no);
	}
	
	public void hit(Integer review_no) throws Exception{
		//글 조회수 
		reviewDao.hit(review_no);
	}
	
	public void write(ReviewDto reviewDto) throws Exception{
		//글 쓰기
		reviewDao.write(reviewDto);
	}
	
	public void update(ReviewDto reviewDto) throws Exception{
		//글 수정
		reviewDao.update(reviewDto);
	}

	public void delete(Integer review_no) throws Exception{
		//글 삭제
		reviewDao.delete(review_no);
	}
}

