package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Notice;

public interface NoticeService {
	public List<Notice> selectAll();
	public Notice selectOne(int no);
	public void createNotice(Notice notice);
	public void deleteNotice(String[] nums);
	public void modifyNotice(Notice notice);
	public void countUp(int no);

}
