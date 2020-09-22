package com.ssafy.happyhouse.model.dto;

import java.util.Date;

//공지사항 dto
public class Notice {
	int no;
	String title;
	String date;
	int count;
	String writer;
	String content;

	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", date=" + date + ", count=" + count + ", writer=" + writer
				+ ", content=" + content + "]";
	}
	
	
	
}
