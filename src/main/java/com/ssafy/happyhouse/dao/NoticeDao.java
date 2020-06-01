package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.NoticeDto;
@Mapper
public interface NoticeDao {

	public void writeNotice(NoticeDto noticeDto) throws SQLException;
	public List<NoticeDto> listNotice(String key, String word) throws SQLException;
	public NoticeDto getNotice(int bookno) throws SQLException;
	public void modifyNotice(NoticeDto noticeDto) throws SQLException;
	public void deleteNotice(int bookno) throws SQLException;
	
}
