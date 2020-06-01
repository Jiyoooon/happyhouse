package com.ssafy.happyhouse.dto;

//Dto : Data Transfer Object
//VO : Value Object
//Bean
public class NoticeDto {

	private int bookno;
	private String userid;
	private String username;
	private String subject;
	private String context;
	private int looked;
	private String date;

	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int bookno, String userid, String username, String subject, String context, int looked,
			String date) {
		super();
		this.bookno = bookno;
		this.userid = userid;
		this.username = username;
		this.subject = subject;
		this.context = context;
		this.looked = looked;
		this.date = date;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getLooked() {
		return looked;
	}

	public void setLooked(int looked) {
		this.looked = looked;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	

}
