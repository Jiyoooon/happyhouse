package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.QnA;

@Mapper
public interface QnADAO {
	public List<QnA> selectQnA();
	public QnA selectQnAByNo(int qnaNo);
	public int insertQnA(QnA board);
	public int updateQnA(QnA board);
	public int deleteQnA(int qnaNo);
	
}
