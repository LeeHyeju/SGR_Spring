package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dto.CategoryDto;

@Repository
public class CategoryDao {

	@Inject
	private SqlSession session;

	private final String NAMESPACE = "com.project.mapper.CategoryMapper";

	public void create(CategoryDto categoryDto) throws Exception {
		// 카테고리 추가
		session.insert(NAMESPACE + ".create", categoryDto);
	}

	public List<CategoryDto> list() throws Exception {
		// 카테고리 리스트
		return session.selectList(NAMESPACE + ".list");
	}

	public List<Map<String, Object>> readListMap() {
		return session.selectList(NAMESPACE + ".readListMap");
	}

	public CategoryDto read(String catesub_cd) throws Exception {
		// 카테고리 보기
		return session.selectOne(NAMESPACE + ".read", catesub_cd);
	}


	public void update(CategoryDto categoryDto) throws Exception {
		// 카테고리 수정 처리
		session.update(NAMESPACE + ".update", categoryDto);
	}	
	
	
	public void delete(String catesub_cd) throws Exception {
		// 카테고리 삭제
		session.delete(NAMESPACE + ".delete", catesub_cd);
	}

	public List<Map<String, Object>> listString() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".listString");
	}

	public List<Map<String, Object>> depthOne() {
		
		return session.selectList(NAMESPACE + ".depthOne");
	}

	public List<Map<String, Object>> depthTwo(String cateGory1) {
		return session.selectList(NAMESPACE + ".depthTwo",cateGory1);
	}

}
