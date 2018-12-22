package com.project.category.service;

import java.util.List;
import java.util.Map;

import com.project.category.dto.CategoryDto;

public interface CategoryService {

	//카테고리 추가
	public void create(CategoryDto categoryDto) throws Exception;
	
	//카테고리 보기
	public List<CategoryDto> list() throws Exception;
	
	//리스트<맵> 리턴방식
	public List<Map<String, Object>> readListMap();

	public Map<String, Object> readListType();

	//카테고리 보기
	public void read(Integer category_no, Integer categorySub_no) throws Exception;
	
	//카테고리 수정
	public void update(CategoryDto categoryDto) throws Exception;
	
	//카테고리 삭제
	public void delete(Integer category_no, Integer categorySub_no ) throws Exception;


}
