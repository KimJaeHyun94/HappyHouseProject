package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import java.util.List;

import com.ssafy.happyhouse.model.dto.UserInfo;

public interface UserInfoDao {
/* crud(insert,delete,update,select) selectAll하지말기! 
 * 1.userInfo.java
 * 2.userinfodao
 * 3.userinfodaoimpl.java
 * 4.houseinfodaoimpl.java
 */
	public void addUserInfo(UserInfo userinfo) throws SQLException;
	public void modifyUserInfo(UserInfo userinfo)throws SQLException;
	public void deleteUserInfo(String id)throws SQLException;
	public UserInfo login(String id,String password)throws SQLException;
}