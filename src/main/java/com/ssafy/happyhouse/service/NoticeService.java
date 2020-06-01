package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.NoticeDto;



public interface NoticeService {

	public void writeNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> listNotice(String key, String word)throws Exception ;
	public NoticeDto getNotice(int bookno) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int bookno) throws Exception;
	
	
}
