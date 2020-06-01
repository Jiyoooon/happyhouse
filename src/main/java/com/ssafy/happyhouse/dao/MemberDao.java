package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Member;

@Mapper
public interface MemberDao {
	//회원 조회
	public List<Member> searchAll() throws SQLException;
	//회원 id로 조회
	public Member search(String id) throws SQLException;
	//회원 등록
	public void insert(Member member) throws SQLException;
	//회원 삭제
	public void delete(String id) throws SQLException;
	//회원 수정
	public void update(Member member) throws SQLException;
	//회원 조회
	public List<Member> listMember(String key, String word) throws  SQLException;
}
