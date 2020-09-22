package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.UserInfo;

public interface UserInfoService {
	public void addUserInfo(UserInfo userinfo);
	public void modifyUserInfo(UserInfo userinfo);
	public void deleteUserInfo(String id);
	public UserInfo login(String id,String password) throws SQLException;
	
}
