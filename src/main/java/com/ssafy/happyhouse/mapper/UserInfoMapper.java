package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.UserInfo;

public interface UserInfoMapper {
	public void addUserInfo(UserInfo userinfo);
	public void modifyUserInfo(UserInfo userinfo);
	public void deleteUserInfo(String id);
	public UserInfo login(String id,String password);
}
