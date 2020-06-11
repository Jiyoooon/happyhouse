package com.ssafy.happyhouse.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.dao.QnADAO;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADAO dao;

	@Override
	public List<QnA> retrieveQnA() {
		 return dao.selectQnA();
	}

	@Override
	public QnA selectQnAByNo(int qnaNo) {
		return dao.selectQnAByNo(qnaNo);
	}

	@Override
	@Transactional
	public boolean insertQnA(QnA qna) {
		return dao.insertQnA(qna)==1;
	}

	@Override
	@Transactional
	public boolean updateQnA(QnA qna) {
		if(qna.getReply_userid() != null && qna.getReply_userid() != "") {
			qna.setReply_datetime(new Date());
		}
		return dao.updateQnA(qna)==1;
	}

	@Override
	@Transactional
	public boolean deleteQnA(int qnaNo) {
		return dao.deleteQnA(qnaNo)==1;
	}

}
