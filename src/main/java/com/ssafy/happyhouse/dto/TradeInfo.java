package com.ssafy.happyhouse.dto;

public class TradeInfo {
	private int no;
	private String shopname;
	private String codename1;
	private String codename2;
	private String codename3;
	private String gu;
	private String dong;
	private String lng;
	private String lat;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getCodename1() {
		return codename1;
	}
	public void setCodename1(String codename1) {
		this.codename1 = codename1;
	}
	public String getCodename2() {
		return codename2;
	}
	public void setCodename2(String codename2) {
		this.codename2 = codename2;
	}
	public String getCodename3() {
		return codename3;
	}
	public void setCodename3(String codename3) {
		this.codename3 = codename3;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "TradeInfo [no=" + no + ", shopname=" + shopname + ", codename1=" + codename1 + ", codename2="
				+ codename2 + ", codename3=" + codename3 + ", gu=" + gu + ", dong=" + dong + ", lng=" + lng + ", lat="
				+ lat + "]";
	}
	
	
}
