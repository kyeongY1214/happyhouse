package com.ssafy.happyhouse.model;

//Dto : Data Transfer Object
//VO : Value Object
//Bean
public class NoticeDto {

	private int noticeno;
	private String userid;
	private String subject;
	private String content;
	private String regtime;

	public int getArticleno() {
		return noticeno;
	}

	public void setArticleno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

}