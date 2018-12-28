package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.common.model.SearchCriteria;
import com.project.dto.GoodsDto;

@Repository
public class GoodsDao {

	@Inject
	private SqlSession session;
	
	//NAMESPACE
	private final String NAMESPACE = "com.project.mapper.GoodsMapper";
	
	//SearchCriteria 
	public List<GoodsDto> list(SearchCriteria cri) throws Exception{
		//회원 상품 조회 리스트	
	return session.selectList(NAMESPACE+".list", cri); 
	}
	
	public List<GoodsDto> adminList(SearchCriteria cri) throws Exception{
		//(관리자) 상품 조회 리스트
		return session.selectList(NAMESPACE+".adminList", cri);
	}
	
	public int listCount(SearchCriteria cri) throws Exception{
		//상품조회 리스트 개수
		return session.selectOne(NAMESPACE+".listCount", cri);	
	}
	
	public GoodsDto view(Integer goods_no) throws Exception{
		//상품 상세보기
		System.out.println("goodsDao.view:"+goods_no);
		return session.selectOne(NAMESPACE+".view", goods_no);	
	}
	
	public void hit(Integer goods_no) throws Exception{
		//조회수 증가
		session.update(NAMESPACE+".hit", goods_no);
	}
	
	public void adminWrite(GoodsDto goodsDto) throws Exception{
		//(관리자)상품 작성
		session.insert(NAMESPACE+".adminWrite", goodsDto);
	}
	
	public void adminUpdate(GoodsDto goodsDto) throws Exception{
		//(관리자)상품 수정
		session.update(NAMESPACE+".adminUpdate", goodsDto);
	}
	
	public void adminDelete(int goods_no) throws Exception{
		//(관리자)상품 삭제
		 session.delete(NAMESPACE+".adminDelete", goods_no);
	}
	
}
