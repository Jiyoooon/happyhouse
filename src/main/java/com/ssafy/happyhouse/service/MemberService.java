package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Member;


public interface MemberService {
	/** id에 해당하는 회원 정보를 추출하는 기능 */
	public Member search(String id);
	public List<Member> searchAll();
	
	/** 회원 인증을 위해 id와 password가 맞는지 확인하는 기능 */
	public Member login(String id, String pw);
	
	/** 동일한 아이디가 있는지 검사하는 기능 ==> 회원 가입시에 확인 */
	public boolean checkId(String id);
	
	/** 회원 등록하는 기능 */
	public void add(Member member);
	
	/** 회원 정보 수정하는 기능 */
	public void update(Member member);
	
	/** 회원 정보 삭제하는 기능 */
	public void remove(String id);
	
	/** 회원 정보 수정하는 기능 */
	public void update(String pw, Member member);
	
	/** 회원 정보 삭제하는 기능 */
	public void remove(String pw, String id);
	/** 회원정보 조회	 */
	public List<Member> listMember(String key, String word) throws Exception;
}
