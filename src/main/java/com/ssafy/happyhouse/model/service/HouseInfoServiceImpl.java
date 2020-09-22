package com.ssafy.happyhouse.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseInfoDao;
import com.ssafy.happyhouse.model.dao.HouseInfoDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseInfo;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {
	@Autowired
	private HouseInfoDao dao;
	
	public HouseInfoServiceImpl() {
		dao = new HouseInfoDaoImpl();
	}
	@Override
	public List<HouseInfo> searchAll(String key, String word) {
		try {
			return dao.searchAll(key, word);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}

	@Override
	public HouseInfo search(int no) {
		try {
			HouseInfo info = dao.search(no);
			if (info == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.", no));
			}
			return info;
		} catch (Exception e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");	
		}
	}

}
