package com.ssafy.happyhouse.model.service;

import java.util.List;
import com.ssafy.happyhouse.model.dto.HouseInfo;

public interface HouseInfoService {
	public List<HouseInfo> searchAll(String key, String word);
	public HouseInfo search(int no);
}
