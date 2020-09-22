package com.ssafy.happyhouse.mapper;

import java.util.List;
import com.ssafy.happyhouse.model.dto.CCTV;

public interface CCTVMapper {
	public List<CCTV> search(String dong);
	
}
