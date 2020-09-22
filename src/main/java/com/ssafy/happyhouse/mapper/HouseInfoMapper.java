package com.ssafy.happyhouse.mapper;

import java.util.List;
import com.ssafy.happyhouse.model.dto.HouseInfo;

public interface HouseInfoMapper {
	public List<HouseInfo> searchAll(String key, String word);
	public HouseInfo search(int no);
}
 