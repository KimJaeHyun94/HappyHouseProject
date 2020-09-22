package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dao.HouseDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.util.PageNavigation;
@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseDao dao;

	public HouseServiceImpl() {
		 dao =new HouseDaoImpl();
	}
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(int startPage, int endPage,String key, String word){
		try {
			
			return dao.searchAll(startPage, endPage,key, word);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");			
		}
	}
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = dao.search(no);
			if (deal == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.", no));
			}
			return deal;
		} catch (Exception e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");	
		}
	}
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10;//페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.getTotalCount(key, word);//총게시글 수 ?
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/sizePerPage+1;//총 페이지수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <=naviSize;//true: 이전x, false: 이전o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalCount-1)/naviSize*naviSize < currentPage;//true: 다음x, false: 다음o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	
	}
	
}




