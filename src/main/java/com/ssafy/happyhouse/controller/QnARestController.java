package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:9999/happyhouse/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/qna")
public class QnARestController {

	private static final Logger logger = LoggerFactory.getLogger(QnARestController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private QnAService qnaService;

    @ApiOperation(value = "모든 질문게시판의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<QnA>> retrieveQnA() throws Exception {
		logger.debug("retrieveQnA - 호출");
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnA(), HttpStatus.OK);
	}
    
    @GetMapping(value = "/{qnaNo}")
    public QnA seletOneQnA(@PathVariable int qnaNo) {
    	return qnaService.selectOneQnA(qnaNo);
    }
    
    @PostMapping	
	public void add(@RequestBody QnA qna) {//insert
		qnaService.add(qna);
	}

	
	@DeleteMapping(value="/{qnaNo}")	//delete	
	public void delete(@PathVariable int qnaNo) {
		qnaService.delete(qnaNo);//List -> json(by jackson)
	}
	
	@PutMapping	
	public void modify(@RequestBody QnA qna) {
		qnaService.modify(qna);
	}
	
	@GetMapping("/id")
	public String sendID(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfo userinfo = (UserInfo) session.getAttribute("userinfo");
		String id =userinfo.getId();
		System.out.println(id);
		return id;
	}

	@GetMapping("/name")
	public String sendName(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfo userinfo = (UserInfo) session.getAttribute("userinfo");
		String name = userinfo.getName();
		System.out.println(name);
		return name;
	}

}