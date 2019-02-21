package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("QnaDto")
public class QnaDto {

	private int qna_no; //질문번호
	private String qna_title; //제목
	private String qna_content; //내용
	private String mb_id; //아이디
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date regdate; //작성일
	private int qna_hit; //조회수
	private int reply_cnt; //댓글
	
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	@Override
	public String toString() {
		return "QnaDto [qna_no=" + qna_no + ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", mb_id="
				+ mb_id + ", regdate=" + regdate + ", qna_hit=" + qna_hit + ", reply_cnt=" + reply_cnt + "]";
	}

	
}