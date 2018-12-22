package com.project.category.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.category.dto.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Inject
	private SqlSession session;

	private final String NAMESPACE = "com.project.mapper.CategoryMapper";

	@Override
	public void create(CategoryDto categoryDto) throws Exception {
		// 카테고리 추가
		session.insert(NAMESPACE + ".create", categoryDto);
	}

	@Override
	public List<CategoryDto> list() throws Exception {
		// 카테고리 리스트
		return session.selectList(NAMESPACE + ".list");
	}

	@Override
	public List<Map<String, Object>> readListMap() {
		return session.selectList(NAMESPACE + ".readListMap");
	}

	@Override
	public void read(Integer category_no, Integer categorySub_no) throws Exception {
		// 카테고리 보기
		Map<String, Object> map = new HashMap<>();
		map.put("category_no", category_no);
		map.put("categorySub_no", categorySub_no);
		session.selectOne(NAMESPACE+".read", map);
	}

	@Override
	public void update(CategoryDto categoryDto) throws Exception {
		// 카테고리 수정
		session.update(NAMESPACE + ".update", categoryDto);
	}

	@Override
	public void delete(Integer category_no, Integer categorySub_no) throws Exception {
		// 카테고리 삭제
		Map<String, Object> map = new HashMap<>();
		map.put("category_no", category_no);
		map.put("categorySub_no", categorySub_no);
		session.delete(NAMESPACE + ".delete", map);
	}

}
