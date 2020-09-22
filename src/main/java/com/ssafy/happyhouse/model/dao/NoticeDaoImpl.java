package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.mapper.NoticeMapper;
import com.ssafy.happyhouse.model.dto.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	NoticeMapper mapper;
	
	@Override
	public List<Notice> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public Notice selectOne(int no) {
		return mapper.selectOne(no);
	}

	@Override
	public void createNotice(Notice notice) {
		mapper.createNotice(notice);
	}

	@Override
	public void countUp(int no) {
		mapper.countUp(no);
	}

	@Override
	public void deleteNotice(String[] nums) {
		mapper.deleteNotice(nums);
	}

	@Override
	public void modifyNotice(Notice notice) {
		mapper.modifyNotice(notice);
	}

}
