package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Notice;

public interface NoticeDao {
	public List<Notice> selectAll();
	public Notice selectOne(int no);
	public void createNotice(Notice notice);
	public void deleteNotice(String[] nums);
	public void modifyNotice(Notice notice);
	public void countUp(int no);
}
