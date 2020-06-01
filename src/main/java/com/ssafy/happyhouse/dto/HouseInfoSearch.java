package com.ssafy.happyhouse.dto;

public class HouseInfoSearch {
	private String dong;
	private int code;
	private String aptName;
	
	public HouseInfoSearch(String dong, int code, String aptName) {
		this.dong = dong;
		this.code = code;
		this.aptName = aptName;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	@Override
	public String toString() {
		return "HouseInfoSearch [dong=" + dong + ", code=" + code + ", aptName=" + aptName + "]";
	}
	
	
	
}
