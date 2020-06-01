package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.dao.NoticeDao;
import com.ssafy.happyhouse.dto.NoticeDto;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;	

	@Transactional
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		if(noticeDto.getSubject() == null || noticeDto.getContext() == null) {
			throw new Exception();
		}
		dao.writeNotice(noticeDto);
	}

	public List<NoticeDto> listNotice(String key, String  word) throws Exception {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return dao.listNotice(key, word);
	}

	public NoticeDto getNotice(int bookno) throws Exception {
		return dao.getNotice(bookno);
	}
	
	@Transactional
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		dao.modifyNotice(noticeDto);
	}

	@Transactional
	public void deleteNotice(int bookno) throws Exception {
		dao.deleteNotice(bookno);
	}

}
