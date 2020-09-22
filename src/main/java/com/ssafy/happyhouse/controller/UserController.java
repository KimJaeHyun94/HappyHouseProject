package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.HouseInfoService;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.UserInfoService;

@Controller
public class UserController {
	@Autowired
	UserInfoService userService;
	@Autowired
	HouseService houseService;
	@Autowired
	HouseInfoService houseInfoService;

	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model, HttpServletRequest request) {
		List<HouseInfo> infos = null;
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		if (key == null || word == null) {
			key = "all";
			word = "";
		}
		System.out.println(key);
		System.out.println(word);
		infos = houseInfoService.searchAll(key, word);
		model.addAttribute("infos",infos);
		return "index";
	}

//	@PostMapping("/index")
//	public String index2(Model model, HttpServletRequest request) {
//		
//		List<HouseInfo> infos = null;
//		String key = request.getParameter("key");
//		String word = request.getParameter("word");
//		if (key == null || word == null) {
//			key = "all";
//			word = "";
//		}
//		System.out.println(key);
//		System.out.println(word);
//		infos = houseInfoService.searchAll(key, word);
//		return "index";
//	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String path = "index";
		try {
			UserInfo userinfo = userService.login(id, password);
			if (userinfo != null) {
				// session 설정
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", userinfo);
			} else {
				// request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// request.setAttribute("msg", "로그인 중 문제가 발생했습니다.");
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			path = "error";
		}
		return path;
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userinfo", null);
		return "index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addUser() {
		return "join";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addUserInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		System.out.println(phone);
		UserInfo newUser = new UserInfo(id, password, name, address, phone);
		userService.addUserInfo(newUser);
		return "index";
	}

	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}

	@PostMapping("/delete")
	public String deleteUserInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		userService.deleteUserInfo(id);
		// session속성 제거
		HttpSession session = request.getSession();
		session.setAttribute("userinfo", null);
		return "index";
	}

	@RequestMapping(value = "/modify1", method = RequestMethod.POST)
	public String modify() {
		return "modify";
	}

	@RequestMapping(value = "/modify2", method = RequestMethod.POST)
	public String modifyUserInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		UserInfo modifyUser = new UserInfo(id, password, name, address, phone);
		userService.modifyUserInfo(modifyUser);

		HttpSession session = request.getSession();
		session.setAttribute("userinfo", modifyUser);

		return "redirect:/mypage";
	}
}
