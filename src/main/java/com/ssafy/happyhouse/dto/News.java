package com.ssafy.happyhouse.dto;

public class News {
	private String imglink;
	private String title;
	private String link;
	private String summary;
	private String company;
	
	public News() {
		// TODO Auto-generated constructor stub
	}

	public News(String imglink, String title, String link, String summary, String company) {
		super();
		this.imglink = imglink;
		this.title = title;
		this.link = link;
		this.summary = summary;
		this.company = company;
	}

	public String getImglink() {
		return imglink;
	}

	public void setImglink(String imglink) {
		this.imglink = imglink;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "News [imglink=" + imglink + ", title=" + title + ", link=" + link + ", summary=" + summary
				+ ", company=" + company + "]";
	}
	
	
}
