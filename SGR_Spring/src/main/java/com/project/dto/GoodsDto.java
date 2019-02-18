package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Alias("GoodsDto")
public class GoodsDto {

	private String goods_no; //상품번호
	private  String goods_name; //상품명
	private String goods_price; //가격
	private String goods_dc; //할인가
	private String goods_maker; //제조사
	private String goods_origin; //원산지
	private String goods_pcs; //개수
	private String goods_hit; //조회수
	private String goods_charge; //배송비
	private String cate_nm;
	private String catesub_cd; //소분류코드
	private MultipartFile goods_img; //대표사진
	public String getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_dc() {
		return goods_dc;
	}
	public void setGoods_dc(String goods_dc) {
		this.goods_dc = goods_dc;
	}
	public String getGoods_maker() {
		return goods_maker;
	}
	public void setGoods_maker(String goods_maker) {
		this.goods_maker = goods_maker;
	}
	public String getGoods_origin() {
		return goods_origin;
	}
	public void setGoods_origin(String goods_origin) {
		this.goods_origin = goods_origin;
	}
	public String getGoods_pcs() {
		return goods_pcs;
	}
	public void setGoods_pcs(String goods_pcs) {
		this.goods_pcs = goods_pcs;
	}
	public String getGoods_hit() {
		return goods_hit;
	}
	public void setGoods_hit(String goods_hit) {
		this.goods_hit = goods_hit;
	}
	public String getGoods_charge() {
		return goods_charge;
	}
	public void setGoods_charge(String goods_charge) {
		this.goods_charge = goods_charge;
	}
	public String getCatesub_cd() {
		return catesub_cd;
	}
	public void setCatesub_cd(String catesub_cd) {
		this.catesub_cd = catesub_cd;
	}
	public MultipartFile getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(MultipartFile goods_img) {
		this.goods_img = goods_img;
	}
	
	
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	@Override
	public String toString() {
		return "GoodsDto [goods_no=" + goods_no + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_dc=" + goods_dc + ", goods_maker=" + goods_maker + ", goods_origin=" + goods_origin
				+ ", goods_pcs=" + goods_pcs + ", goods_hit=" + goods_hit + ", goods_charge=" + goods_charge
				+ ", cate_nm=" + cate_nm + ", catesub_cd=" + catesub_cd + ", goods_img=" + goods_img + "]";
	}
	
}