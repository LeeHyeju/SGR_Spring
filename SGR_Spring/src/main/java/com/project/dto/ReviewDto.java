package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("ReviewDto")
public class ReviewDto {
	
	private int review_no; //리뷰 번호
	private int goods_no; //상품 번호
	private String goods_name; //상품 이름
	private String catesub_cd; //소분류 코드
	private String mb_id; //아이디
	private String review_title; //제목
	private String review_content; //내용
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date reg_date; //날짜
	private int review_hit;//조회수
	private String goods_img;
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public String getCatesub_cd() {
		return catesub_cd;
	}
	public void setCatesub_cd(String catesub_cd) {
		this.catesub_cd = catesub_cd;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	
	
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	@Override
	public String toString() {
		return "ReviewDto [review_no=" + review_no + ", goods_no=" + goods_no + ", goods_name=" + goods_name
				+ ", catesub_cd=" + catesub_cd + ", mb_id=" + mb_id + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", reg_date=" + reg_date + ", review_hit=" + review_hit
				+ ", goods_img=" + goods_img + "]";
	}
	
}
