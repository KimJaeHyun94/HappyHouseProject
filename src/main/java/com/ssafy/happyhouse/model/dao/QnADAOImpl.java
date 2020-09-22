package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.mapper.QnAMapper;
import com.ssafy.happyhouse.model.dto.QnA;
@Repository
public class QnADAOImpl implements QnADAO {
	@Autowired
	QnAMapper mapper;
	
	@Override
	public List<QnA> selectQnA() {
		return mapper.selectQnA();
	}

	@Override
	public QnA selectOneQnA(int qnaNo) {
		return mapper.selectOneQnA(qnaNo);
	}

	@Override
	public void add(QnA qna) {
		mapper.add(qna);
	}

	@Override
	public void delete(int qnaNo) {
		mapper.delete(qnaNo);
	}

	@Override
	public void modify(QnA qna) {
		mapper.modify(qna);
	}

}
