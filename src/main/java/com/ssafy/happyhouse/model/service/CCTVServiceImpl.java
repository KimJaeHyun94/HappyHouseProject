package com.ssafy.happyhouse.model.service;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.CCTVDao;
import com.ssafy.happyhouse.model.dao.CCTVDaoImpl;

import com.ssafy.happyhouse.model.dto.CCTV;

@Service
public class CCTVServiceImpl implements CCTVService{
	@Autowired
	private CCTVDao dao;

	public CCTVServiceImpl() {
		 dao=new CCTVDaoImpl();
	}
	public List<CCTV> search(String dong){
		try {
			List<CCTV> cctvs = dao.search(dong);
			if (cctvs == null) {
				throw new HappyHouseException(String.format("동 이름에 해당하는 주택거래 정보가 존재하지 않습니다."));
			}
			return cctvs;
		} catch (Exception e) {
			e.printStackTrace();
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");			
		}
	}
}




