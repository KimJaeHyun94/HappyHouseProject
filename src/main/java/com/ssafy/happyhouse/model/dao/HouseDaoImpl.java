package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.mapper.HouseMapper;
import com.ssafy.happyhouse.model.dto.HouseDeal;

@Repository
public class HouseDaoImpl implements HouseDao{
	
	@Autowired
	HouseMapper mapper;
	
	public HouseDaoImpl() {
	}
	/**
	 * 아파트 정보와 아파트 거래 정보를  xml 파일에서 읽어온다.
	 */
	public void loadData() { }
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(int startPage, int endPage,String key, String word) throws SQLException{

		return mapper.searchAll(startPage, endPage,key, word);
	}
	
	/**
	 * 주택 거래 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환한다.<br/>
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) throws SQLException {
		return mapper.search(no);
	}
	@Override
	public int getTotalCount(String key, String word) throws SQLException {
		return mapper.getTotalCount(key, word);
	}
	
	public static void main(String[] args) {
		HouseDao dao = new HouseDaoImpl();
	}
	
}





