package com.project.category.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.category.dao.CategoryDao;
import com.project.category.dto.CategoryDto;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDao categoryDao;

	@Override
	public void create(CategoryDto categoryDto) throws Exception {
		// 카테고리 추가
		categoryDao.create(categoryDto);
	}

	@Override
	public List<CategoryDto> list() throws Exception {
		// 카테고리 보기
		return categoryDao.list();
	}

	@Override
	public void update(CategoryDto categoryDto) throws Exception {
		// 카테고리 수정
		categoryDao.update(categoryDto);
	}

	@Override
	public void delete(Integer category_no, Integer categorySub_no) throws Exception {
		// 카테고리 삭제
		categoryDao.delete(category_no, categorySub_no);
	}
	
	//read.do List<Map> 리턴방식
	@Override
	public List<Map<String, Object>> readListMap() {
		return categoryDao.readListMap();
	}

	@Override
	public Map<String, Object> readListType() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void read(Integer category_no, Integer categorySub_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
