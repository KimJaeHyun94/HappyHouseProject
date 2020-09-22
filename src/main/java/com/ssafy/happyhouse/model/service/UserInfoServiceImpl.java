package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.UserInfoDao;
import com.ssafy.happyhouse.model.dao.UserInfoDaoImpl;
import com.ssafy.happyhouse.model.dto.UserInfo;
@Service
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoDao dao; 
	
	public UserInfoServiceImpl() {
		dao = new UserInfoDaoImpl();
	}

	@Override
	public void addUserInfo(UserInfo userinfo) {
		try {
			dao.addUserInfo(userinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void modifyUserInfo(UserInfo userinfo) {
		try {
			dao.modifyUserInfo(userinfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUserInfo(String id) {
		try {
			dao.deleteUserInfo(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public UserInfo login(String id, String password) throws SQLException {
		return dao.login(id, password);
	}

}
