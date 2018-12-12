package com.project.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDto {
	private int mb_no;
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_sex;
	private int mb_bday;
	private int mb_phone;
	private String mb_email;
	private int mb_zipcode;
	private String mb_address;
	private int grade;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mb_joinDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mb_leaveDate;

	public int getMb_no() {
		return mb_no;
	}
	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}
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
	public int getMb_bday() {
		return mb_bday;
	}
	public void setMb_bday(int mb_bday) {
		this.mb_bday = mb_bday;
	}
	public int getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(int mb_phone) {
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
		return "MemberDto [mb_no=" + mb_no + ", mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name
				+ ", mb_sex=" + mb_sex + ", mb_bday=" + mb_bday + ", mb_phone=" + mb_phone + ", mb_email=" + mb_email
				+ ", mb_zipcode=" + mb_zipcode + ", mb_address=" + mb_address + ", grade=" + grade + ", mb_joinDate="
				+ mb_joinDate + ", mb_leaveDate=" + mb_leaveDate + "]";
	}
	
}
