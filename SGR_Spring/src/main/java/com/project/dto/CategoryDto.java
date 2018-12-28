package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("CategoryDto")
public class CategoryDto {
	private String cate_cd;  //대분류 코드
	private String cate_nm; //대분류명
	private String catesub_cd; //소분류 코드
	private String catesub_nm; //소분류명
	
	
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	public String getCatesub_cd() {
		return catesub_cd;
	}
	public void setCatesub_cd(String catesub_cd) {
		this.catesub_cd = catesub_cd;
	}
	public String getCatesub_nm() {
		return catesub_nm;
	}
	public void setCatesub_nm(String catesub_nm) {
		this.catesub_nm = catesub_nm;
	}
	
	
	@Override
	public String toString() {
		return "CategoryDto [cate_cd=" + cate_cd + ", cate_nm=" + cate_nm + ", catesub_cd=" + catesub_cd
				+ ", catesub_nm=" + catesub_nm + "]";
	}



}