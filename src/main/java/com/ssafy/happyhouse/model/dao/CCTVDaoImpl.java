package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ssafy.happyhouse.mapper.CCTVMapper;
import com.ssafy.happyhouse.model.dto.CCTV;

@Repository
public class CCTVDaoImpl implements CCTVDao {
	@Autowired
	CCTVMapper mapper;

	public CCTVDaoImpl() {
	}

	public List<CCTV> search(String dong) throws SQLException {
		return mapper.search(dong);
	}

	public static void main(String[] args) {
		CCTVDao dao = new CCTVDaoImpl();
	}

}
