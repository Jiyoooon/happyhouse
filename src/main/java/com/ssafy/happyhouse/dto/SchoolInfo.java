package com.ssafy.happyhouse.dto;

public class SchoolInfo {

	private String school_id;
	private String school_name;
	private String grade;
	private String head_branch;
	private String oper_state;
	private String jibun_addr;
	private String doro_add;
	private String lat;
	private String lng;
	private String sido_name;
	private String gugun_name;
	private String dong;
	
	public SchoolInfo() {
		// TODO Auto-generated constructor stub
	}

	public SchoolInfo(String school_id, String school_name, String grade, String head_branch, String oper_state,
			String jibun_addr, String doro_add, String lat, String lng, String sido_name, String gugun_name,
			String dong) {
		super();
		this.school_id = school_id;
		this.school_name = school_name;
		this.grade = grade;
		this.head_branch = head_branch;
		this.oper_state = oper_state;
		this.jibun_addr = jibun_addr;
		this.doro_add = doro_add;
		this.lat = lat;
		this.lng = lng;
		this.sido_name = sido_name;
		this.gugun_name = gugun_name;
		this.dong = dong;
	}

	public String getSchool_id() {
		return school_id;
	}

	public void setSchool_id(String school_id) {
		this.school_id = school_id;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getHead_branch() {
		return head_branch;
	}

	public void setHead_branch(String head_branch) {
		this.head_branch = head_branch;
	}

	public String getOper_state() {
		return oper_state;
	}

	public void setOper_state(String oper_state) {
		this.oper_state = oper_state;
	}

	public String getJibun_addr() {
		return jibun_addr;
	}

	public void setJibun_addr(String jibun_addr) {
		this.jibun_addr = jibun_addr;
	}

	public String getDoro_add() {
		return doro_add;
	}

	public void setDoro_add(String doro_add) {
		this.doro_add = doro_add;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getSido_name() {
		return sido_name;
	}

	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}

	public String getGugun_name() {
		return gugun_name;
	}

	public void setGugun_name(String gugun_name) {
		this.gugun_name = gugun_name;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	@Override
	public String toString() {
		return "SchoolInfo [school_id=" + school_id + ", school_name=" + school_name + ", grade=" + grade
				+ ", head_branch=" + head_branch + ", oper_state=" + oper_state + ", jibun_addr=" + jibun_addr
				+ ", doro_add=" + doro_add + ", lat=" + lat + ", lng=" + lng + ", sido_name=" + sido_name
				+ ", gugun_name=" + gugun_name + ", dong=" + dong + "]";
	}
	
	
}
