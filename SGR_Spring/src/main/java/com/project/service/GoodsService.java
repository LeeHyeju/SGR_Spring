package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.common.model.SearchCriteria;
import com.project.dao.GoodsDao;
import com.project.dto.GoodsDto;

@Service
public class GoodsService {

	@Inject
	private GoodsDao goodsDao;
	
	//SearchCriteria 
		public List<GoodsDto> list(SearchCriteria cri) throws Exception{
			//회원 상품 조회 리스트	
		return goodsDao.list(cri); 
		}
		
		public List<GoodsDto> adminList(SearchCriteria cri) throws Exception{
			//(관리자) 상품 조회 리스트
			return goodsDao.adminList(cri);
		}
		
		public int listCount(SearchCriteria cri) throws Exception{
			//상품조회 리스트 개수
			return goodsDao.listCount(cri);	
		}
		
		public GoodsDto view(Integer goods_no) throws Exception{
			//상품 상세보기
			return goodsDao.view(goods_no);	
		}
		
		public void hit(Integer goods_no) throws Exception{
			//조회수 증가
			goodsDao.hit(goods_no);
		}
		
		public void adminWrite(GoodsDto goodsDto) throws Exception{
			//(관리자)상품 작성
			goodsDao.adminWrite(goodsDto);
		}
		
		public void adminUpdate(GoodsDto goodsDto) throws Exception{
			//(관리자)상품 수정
			goodsDao.adminUpdate(goodsDto);
		}
		
		public void adminDelete(int goods_no) throws Exception{
			//(관리자)상품 삭제
			goodsDao.adminDelete(goods_no);
		}
		
}
