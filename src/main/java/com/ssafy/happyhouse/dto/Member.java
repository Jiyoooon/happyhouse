package com.ssafy.happyhouse.dto;

public class Member {
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String tel;
	private boolean isadmin;
	
	public Member() {}

	
	public Member(String userid, String userpwd, String username, String email, String tel, boolean isadmin) {
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.email = email;
		this.tel = tel;
		this.isadmin = isadmin;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public boolean getIsAdmin() {
		return isadmin;
	}
	
	public void setIsAdmin(boolean isadmin) {
		this.isadmin = isadmin;
	}


	@Override
	public String toString() {
		return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email
				+ ", tel=" + tel + ", isadmin=" + isadmin + "]";
	}
	
	
}
