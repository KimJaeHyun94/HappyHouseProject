package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface HouseMapper {
	public List<HouseDeal> searchAll(int startPage, int endPage,String key, String word);
	public HouseDeal search(int no);
	public int getTotalCount(String key, String word) throws SQLException;
	
}
