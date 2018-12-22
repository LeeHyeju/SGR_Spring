package com.project.category.dto;

public class CategoryDto {
	private int category_no;
	private int categorySub_no;
	private String category_name;
	
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getCategorySub_no() {
		return categorySub_no;
	}
	public void setCategorySub_no(int categorySub_no) {
		this.categorySub_no = categorySub_no;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	@Override
	public String toString() {
		return "CategoryDto [category_no=" + category_no + ", categorySub_no=" + categorySub_no + ", category_name="
				+ category_name + "]";
	}
}
