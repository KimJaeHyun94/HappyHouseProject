package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
	
	
	//http://localhost:9090/boot/notice
	@RequestMapping(value= "/notice", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectAll(Model model) {
		return "notice_list";
	}
	
	@RequestMapping(value = "/notice/{no}", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectOne(Model model,@PathVariable int no) {
		Notice notice = service.selectOne(no);
		//Enter값 치환
		String content = notice.getContent();
		content = content.replace("\r\n", "<br>");
		notice.setContent(content);
		countUp(no);
		model.addAttribute("notice", notice);
		return "notice_detail";
	}
	
	@GetMapping(value = "/notice/create")
	public String createNoticeForm() {
		return "notice_create";
	}
	
	@PostMapping(value = "/notice/create")
	public String createNotice(HttpServletRequest request ) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContent(content);
		service.createNotice(notice);
		
		return "redirect:/notice";
	}
	
	@PostMapping(value = "/notice/modify")
	public String modifyNoticeForm(Model model ,HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice notice = new Notice();
		notice.setNo(no);
		notice.setTitle(title);
		notice.setContent(content);
		
		model.addAttribute("notice",notice);
		return "notice_modify";
	}
	
	@PostMapping(value = "/notice/modify/{no}")
	public String modifyNotice(@PathVariable int no,HttpServletRequest request ) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice notice = new Notice();
		notice.setNo(no);
		notice.setTitle(title);
		notice.setContent(content);
		service.modifyNotice(notice);
		
		return "redirect:/notice/"+no;
	}
	
	
	
	//조회수 증가
	public void countUp(int no) {
		service.countUp(no);
	}
}
