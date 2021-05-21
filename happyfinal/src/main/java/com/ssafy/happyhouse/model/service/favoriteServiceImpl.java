package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.favoriteMapper;
import com.ssafy.happyhouse.model.HouseDto;

@Service
public class favoriteServiceImpl implements favoriteService {
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public ArrayList<HouseDto> getFavoriteList(String userid) throws SQLException {
		return null;
	}

	@Override
	public void setFavoriteList(String userid, String city, String dong, String gugun) throws SQLException {
		
	}
	
	

}
