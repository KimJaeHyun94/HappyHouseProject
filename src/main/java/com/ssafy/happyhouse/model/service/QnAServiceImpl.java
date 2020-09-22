package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.QnADAO;
import com.ssafy.happyhouse.model.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService{
	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	public QnA selectOneQnA(int qnaNo) {
		return dao.selectOneQnA(qnaNo);
	}

	@Override
	public void delete(int qnaNo) {
		dao.delete(qnaNo);
	}

	
	@Override
	public void modify(QnA qna) {
		dao.modify(qna);
	}

	@Override
	public void add(QnA qna) {
		dao.add(qna);
	}
}
