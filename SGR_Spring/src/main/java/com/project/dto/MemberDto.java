package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("MemberDto")
public class MemberDto {
	private String mb_id; //아이디
	private String mb_pw; //비밀번호
	private String mb_name; //이름
	private String mb_sex; //성별
	private String mb_bday; //생년월일
	private String mb_phone; //연락처
	private String mb_email; //이메일
	private int mb_zipcode; //우편번호
	private String mb_address; //도로명주소
	private String mb_addressDetail; //상세주소
	private int mb_grade; //회원등급
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mb_joinDate; //가입일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mb_leaveDate; //탈퇴일자


	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_sex() {
		return mb_sex;
	}

	public void setMb_sex(String mb_sex) {
		this.mb_sex = mb_sex;
	}

	public String getMb_bday() {
		return mb_bday;
	}

	public void setMb_bday(String mb_bday) {
		this.mb_bday = mb_bday;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public int getMb_zipcode() {
		return mb_zipcode;
	}

	public void setMb_zipcode(int mb_zipcode) {
		this.mb_zipcode = mb_zipcode;
	}

	public String getMb_address() {
		return mb_address;
	}

	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}

	public String getMb_addressDetail() {
		return mb_addressDetail;
	}

	public void setMb_addressDetail(String mb_addressDetail) {
		this.mb_addressDetail = mb_addressDetail;
	}

	public int getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(int mb_grade) {
		this.mb_grade = mb_grade;
	}

	public Date getMb_joinDate() {
		return mb_joinDate;
	}

	public void setMb_joinDate(Date mb_joinDate) {
		this.mb_joinDate = mb_joinDate;
	}

	public Date getMb_leaveDate() {
		return mb_leaveDate;
	}

	public void setMb_leaveDate(Date mb_leaveDate) {
		this.mb_leaveDate = mb_leaveDate;
	}

	@Override
	public String toString() {
		return "MemberDto [ mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name
				+ ", mb_sex=" + mb_sex + ", mb_bday=" + mb_bday + ", mb_phone=" + mb_phone + ", mb_email=" + mb_email
				+ ", mb_zipcode=" + mb_zipcode + ", mb_address=" + mb_address + ", mb_addressDetail=" + mb_addressDetail
				+ ", mb_grade=" + mb_grade + ", mb_joinDate=" + mb_joinDate + ", mb_leaveDate=" + mb_leaveDate + "]";
	}

}
