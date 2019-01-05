package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("QnaReplyDto")
public class QnaReplyDto {

	private Integer rno;
	private Integer qna_no;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	
	
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getQna_no() {
		return qna_no;
	}
	public void setQna_no(Integer qna_no) {
		this.qna_no = qna_no;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "QnaReplyDto [rno=" + rno + ", qna_no=" + qna_no + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
}
