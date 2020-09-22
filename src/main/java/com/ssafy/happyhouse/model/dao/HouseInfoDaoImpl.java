package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.mapper.HouseInfoMapper;
import com.ssafy.happyhouse.model.dto.HouseInfo;
@Repository
public class HouseInfoDaoImpl implements HouseInfoDao{
	@Autowired
	HouseInfoMapper mapper;
	
	public HouseInfoDaoImpl() {
	}
	public void loadData() {}

	public List<HouseInfo> searchAll(String key, String word) throws SQLException {
		return mapper.searchAll(key, word);
	}

	public HouseInfo search(int no) throws SQLException {
		return mapper.search(no);
	}
	
	public static void main(String[] args) {
		HouseInfoDao dao = new HouseInfoDaoImpl();
	}

}
