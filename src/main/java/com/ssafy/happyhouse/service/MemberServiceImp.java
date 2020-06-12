package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.dao.MemberDao;
import com.ssafy.happyhouse.dto.Member;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDao dao;
	
	/** id에 해당하는 회원 정보를 추출하는 기능 */
	public Member search(String userid) {
		try {
			return dao.search(userid);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 상세정보 조회 중 오류 발생");
		}
	}

	public List<Member> searchAll() {
		try {
			return dao.searchAll();
		}catch(Exception e) {
			throw new HappyHouseException("회원 정보를 조회 중 오류 발생");
		}
	}
	
	/** 회원 인증을 위해 id와 password가 맞는지 확인하는 기능 */
	public Member login(String id, String pw) {
		Member member = null;
		try {
			member = dao.search(id);
			if(member == null) return null;//(아이디 못찾음)controller로 throw
			if(!member.getUserpwd().equals(pw)) return null;//(비번 다름)controller로 throw
		} catch (SQLException e) {
			throw new HappyHouseException("인증 정보 처리 중 오류 발생");
		}
		return member;
	}
	
	/** 동일한 아이디가 있는지 검사하는 기능 ==> 회원 가입시에 확인 */
	@Override
	public boolean checkId(String id) {
		try {
			Member member = dao.search(id);
			if(member != null) return false;//이미 있는 아이디
			else return true;//사용할 수 있는 아이디
		} catch (SQLException e) {
			throw new HappyHouseException("회원 상세정보 조회 시 오류 발생");
		}
	}

	/** 회원 등록하는 기능 */
	@Transactional
	public void add(Member member) {
		try {
			dao.insert(member);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 등록 처리 중 오류 발생");
		}
	}
	
	/** 회원 정보 업데이트하는 기능 */
	@Transactional
	public void update(Member member) {
		try {
			dao.update(member);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 정보 업데이트 중 오류 발생");
		}
	} 
	
	/** 회원 정보 삭제하는 기능 */
	@Transactional
	public void remove(String id) {
		try {
			dao.delete(id);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 정보 삭제 중 오류 발생");
		}
	}

	@Transactional
	public void update(String pw, Member member) {
		if(pw != member.getUserpwd()) {
			throw new HappyHouseException("입력한 비밀번호가 다릅니다");//controller로 throw
		}
		try {
			dao.update(member);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 정보 업데이트 중 오류 발생");
		}
	}
	
	@Transactional
	public void remove(String pw, String id) {
		Member member = null;
		try {
			member = dao.search(id);
		} catch (SQLException e1) {
			throw new HappyHouseException("회원 상세정보 조회 중 오류 발생");
		}
		if(pw != member.getUserpwd()) {//controller로 throw
			throw new HappyHouseException("입력한 비밀번호가 다릅니다");
		}
		try {
			dao.delete(id);
		} catch (SQLException e) {
			throw new HappyHouseException("회원 정보 삭제 중 오류 발생");
		}
	}
	
	
	public List<Member> listMember(String key, String word) throws Exception {
		return dao.listMember(key, word);
	}
}
