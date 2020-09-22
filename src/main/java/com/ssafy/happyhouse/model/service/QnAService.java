package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;


public interface QnAService {
	public List<QnA> retrieveQnA();
	public QnA selectOneQnA(int qnaNo);
	public void add(QnA qna);
	public void delete(int qnaNo);
	public void modify(QnA qna);
}
