package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.QnA;

public interface QnAService {
	public List<QnA> retrieveQnA();
	public QnA selectQnAByNo(int qnaNo);
	public boolean insertQnA(QnA board);
	public boolean updateQnA(QnA board);
	public boolean deleteQnA(int qnaNo);
}
