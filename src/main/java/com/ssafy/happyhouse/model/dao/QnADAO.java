package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;


public interface QnADAO {
	public List<QnA> selectQnA();
	public QnA selectOneQnA(int qnaNo);
	public void add(QnA qna);
	public void delete(int qnaNo);
	public void modify(QnA qna);
	
}
