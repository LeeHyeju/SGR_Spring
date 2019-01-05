package com.project.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CategoryDao;
import com.project.dto.CategoryDto;

@Service
public class  CategoryService {

	@Inject
	private CategoryDao categoryDao;

	
	public void create(CategoryDto categoryDto) throws Exception {
		// 카테고리 추가
		categoryDao.create(categoryDto);
	}

	public List<CategoryDto> list() throws Exception {
		// 카테고리 리스트
		return categoryDao.list();
	}

	public List<Map<String, Object>> listString() throws Exception {
		// 카테고리 리스트
		return categoryDao.listString();
	}
	
	public CategoryDto read(String catesub_cd) throws Exception {
		// 카테고리 보기
		return categoryDao.read(catesub_cd);
	}


	public void update(CategoryDto categoryDto) throws Exception {
		// 카테고리 수정 처리
		categoryDao.update(categoryDto);
	}	
	
	public void delete(String catesub_cd) throws Exception {
		// 카테고리 삭제
		categoryDao.delete(catesub_cd);
	}
	
	//read.do List<Map> 리턴방식
	public List<Map<String, Object>> readListMap() {
		return categoryDao.readListMap();
	}


	public Map<String, Object> readListType() {
		// List
		return null;
	}

	public List<Map<String,Object>> depthOne() {
		
		return categoryDao.depthOne();
	}

	public List<Map<String,Object>> depthTwo(String cate_nm) {
		return categoryDao.depthTwo(cate_nm);
		
	}
}
