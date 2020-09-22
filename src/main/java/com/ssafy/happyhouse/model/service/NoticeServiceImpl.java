package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.NoticeDao;
import com.ssafy.happyhouse.model.dto.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Notice selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public void createNotice(Notice notice) {
		dao.createNotice(notice);
	}
	@Override
	public void deleteNotice(String[] nums) {
		dao.deleteNotice(nums);
	}

	@Override
	public void modifyNotice(Notice notice) {
		dao.modifyNotice(notice);
	}
	
	@Override
	public void countUp(int no) {
		dao.countUp(no);
	}

	



}
