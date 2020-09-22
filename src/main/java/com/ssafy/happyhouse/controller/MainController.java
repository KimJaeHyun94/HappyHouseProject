package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.CCTV;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.service.CCTVService;
import com.ssafy.happyhouse.model.service.HouseInfoService;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
public class MainController {
	@Autowired
	HouseService houseService;
	
	@Autowired
	HouseInfoService houseInfoService;
	
	@Autowired
	CCTVService cctvService;
	
	static int currentPage = 1;//현재 페이지(기본 1페이지)
	static String key, word;//검색 조건(기본 null)
	
	// 아파트 이미지 출력을 위한 String 배열
	String [] imgNames = {
	            "건양하늘터.jpg", "경희궁의아침.jpg", "광화문풍림스페이스본.jpg",
	            "교북동경희궁자이(4단지).jpg", "다세대주택.jpg", "동성아파트.jpg", "무악동인왕산아이파크.jpg",
	            "무악동현대.jpg", "숭인동롯데캐슬천지인.jpg", "숭인동삼전솔하임2차.jfif", "숭인동숭인한양LEEPS.jfif",
	            "숭인동종로센트레빌.jfif", "숭인동종로중흥S클래스.jfif", "숭인동종로청계힐스테이트.jfif",
	            "신동아블루아광화문.jpg", "아남1.jpg", "창신동덕산.jpg", "창신동두산.jpg", "창신동창신쌍용1.jpg",
	            "창신동창신쌍용2.jpg", "평동경희궁자이(3단지).jpg", "평창동갑을.jpg", "평창동삼성.jfif",
	            "평창동엘리시아.jfif", "현대뜨레비앙.jpg", "홍파동경희궁자이(2단지).jpg", "효성쥬얼리시티.jfif", "CS타워.jfif"
	};
	
	@RequestMapping(value= "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectAll(Model model, HttpServletRequest request) {
		currentPage = Integer.parseInt(request.getParameter("pg"));//현재페이지번호
		String spp = request.getParameter("spp");//한페이지당 글갯수
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);//sizePerPage
		
		List<HouseDeal> deals = null;
		key = request.getParameter("key");
		word = request.getParameter("word");
		if(key == null || word == null) {
			key = "all";
			word = "";
		}
		//--- 선택하세요 --- 인경우
		if(key.equals("all")) {
			word = "";
		}
		
		int startPage = (currentPage-1)*sizePerPage;
		int endPage = sizePerPage;
		
		deals = houseService.searchAll(startPage, endPage,key,word);
		try {
			PageNavigation pageNavigation = houseService.makePageNavigation(currentPage, sizePerPage, key, word);
			model.addAttribute("navigation", pageNavigation);
			model.addAttribute("deals",deals);
			model.addAttribute("pg", currentPage);
			model.addAttribute("key", key);
			model.addAttribute("word", word);
			System.out.println("key: "+key);
			System.out.println("word: "+word);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}
	
	@GetMapping("/read")
	public String search(Model model,HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		HouseDeal deal = houseService.search(no);
		String imgSrc = null;
		List<CCTV> cctvs = null;

		for(String imgName: imgNames) {
			String[] image = imgName.split("[.]");
			String name = image[0];
			if(image[0].contains("동")) {
				String[] temp = image[0].split("동");
				if(deal.getDong().contains(temp[0])) {
					name = temp[temp.length-1];
				}
			}
			if(name.equals(deal.getAptName())) {
				imgSrc = imgName;
				break;
			}else if(deal.getAptName().contains(name)) {
				imgSrc = imgName;
				break;
			}
		}
		if(imgSrc==null) {
			imgSrc = "다세대주택.jpg";
		}
		System.out.println(deal.getDong());
		cctvs = cctvService.search(deal.getDong());
		for (int i = 0; i < cctvs.size(); i++) {
			//cctvs.get(i).setDong("서울특별시종로구사직동287");
			System.out.println(cctvs.get(i));
		}
		model.addAttribute("deal", deal);
		model.addAttribute("cctvs", cctvs);
		model.addAttribute("imgsrc", imgSrc);
		
		return "read";
	}
	
	@GetMapping("/qna")
	public String QnA() {
		return "qna";
	}
	
	@GetMapping("/hidden")
	public String Hidden() {
		return "hidden";
	}
	
	@GetMapping("/info")
	public String Info() {
		return "info";
	}
}
