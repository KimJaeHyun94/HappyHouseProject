package com.ssafy.happyhouse.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.NoticeService;
@RestController
public class NoticeRestController {
	@Autowired
	NoticeService service;
	
	//http://localhost:9090/boot/notice
	@RequestMapping(value= "/notice_rest", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Notice> selectAll() {
		return service.selectAll();
	}
	
	@DeleteMapping("/notice")
	public Map deleteNotice(@RequestBody String[] nums) {
		service.deleteNotice(nums);
		Map map = new HashMap();
		map.put("result", "deleteSuccess");
		return map;
	}
}
