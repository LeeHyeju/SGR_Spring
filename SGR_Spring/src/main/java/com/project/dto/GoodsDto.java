package com.project.dto;

import org.apache.ibatis.type.Alias;


public class GoodsDto {
	
	private int goods_no; //상품번호
	private  String goods_name; //상품명
	private int goods_price; //가격
	private int goods_dc; //할인가
	private String goods_maker; //제조사
	private String goods_origin; //원산지
	private int goods_pcs; //개수
	private int goods_hit; //조회수
	private int goods_charge; //배송비
	private String catesub_cd; //소분류코드
	
	
	
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_dc() {
		return goods_dc;
	}
	public void setGoods_dc(int goods_dc) {
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
	public int getGoods_pcs() {
		return goods_pcs;
	}
	public void setGoods_pcs(int goods_pcs) {
		this.goods_pcs = goods_pcs;
	}
	public int getGoods_hit() {
		return goods_hit;
	}
	public void setGoods_hit(int goods_hit) {
		this.goods_hit = goods_hit;
	}
	public int getGoods_charge() {
		return goods_charge;
	}
	public void setGoods_charge(int goods_charge) {
		this.goods_charge = goods_charge;
	}
	public String getCatesub_cd() {
		return catesub_cd;
	}
	public void setCatesub_cd(String catesub_cd) {
		this.catesub_cd = catesub_cd;
	}
	
	
	@Override
	public String toString() {
		return "GoodsDto [goods_no=" + goods_no + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_dc=" + goods_dc + ", goods_maker=" + goods_maker + ", goods_origin=" + goods_origin
				+ ", goods_pcs=" + goods_pcs + ", goods_hit=" + goods_hit + ", goods_charge=" + goods_charge
				+ ", catesub_cd=" + catesub_cd + "]";
	}
}