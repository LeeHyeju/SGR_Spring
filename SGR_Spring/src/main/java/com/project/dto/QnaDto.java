package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("QnaDto")
public class QnaDto {

	private int qna_no; //질문번호
	private int goods_no; //상품번호
	private String catesub_cd; //소분류코드
	private String mb_id; //아이디
	private String qna_title; //제목
	private String qna_content; //내용
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date; //작성일
	private int qna_hit; //조회수
	private String qna_notice; //공지사항
	private int parent;
	private String reply;//답글 
	private String comment; //댓글
	private String comment_reply; //답댓글
	private int replycnt;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	public String getQna_notice() {
		return qna_notice;
	}
	public void setQna_notice(String qna_notice) {
		this.qna_notice = qna_notice;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getComment_reply() {
		return comment_reply;
	}
	public void setComment_reply(String comment_reply) {
		this.comment_reply = comment_reply;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	@Override
	public String toString() {
		return "QnaDto [qna_no=" + qna_no + ", goods_no=" + goods_no + ", catesub_cd=" + catesub_cd + ", mb_id=" + mb_id
				+ ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", reg_date=" + reg_date + ", qna_hit="
				+ qna_hit + ", qna_notice=" + qna_notice + ", parent=" + parent + ", reply=" + reply + ", comment="
				+ comment + ", comment_reply=" + comment_reply + ", replycnt=" + replycnt + "]";
	}
	
	
}