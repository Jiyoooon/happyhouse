package com.ssafy.happyhouse.dto;

public class IntrestArea {
	private String area_userid;
	private String area_sido;
	private String area_gugun;
	private String area_dong;

	private SidoCode sido_name;

	public String getArea_userid() {
		return area_userid;
	}

	public void setArea_userid(String area_userid) {
		this.area_userid = area_userid;
	}

	public String getArea_sido() {
		return area_sido;
	}

	public void setArea_sido(String area_sido) {
		this.area_sido = area_sido;
	}

	public String getArea_gugun() {
		return area_gugun;
	}

	public void setArea_gugun(String area_gugun) {
		this.area_gugun = area_gugun;
	}

	public String getArea_dong() {
		return area_dong;
	}

	public void setArea_dong(String area_dong) {
		this.area_dong = area_dong;
	}

	public SidoCode getSido_name() {
		return sido_name;
	}

	public void setSido_name(SidoCode sido_name) {
		this.sido_name = sido_name;
	}

	@Override
	public String toString() {
		return "IntrestArea [area_userid=" + area_userid + ", area_sido=" + area_sido + ", area_gugun=" + area_gugun
				+ ", area_dong=" + area_dong + ", sido_name=" + sido_name + "]";
	}
	
}
