package com.ssafy.happyhouse.model.service;

import java.util.List;
import com.ssafy.happyhouse.model.dto.CCTV;

public interface CCTVService {
	public List<CCTV> search(String dong);
}
