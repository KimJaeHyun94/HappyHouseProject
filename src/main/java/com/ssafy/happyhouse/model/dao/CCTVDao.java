package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import java.util.List;
import com.ssafy.happyhouse.model.dto.CCTV;

public interface CCTVDao {
	public List<CCTV> search(String dong) throws SQLException;
}
