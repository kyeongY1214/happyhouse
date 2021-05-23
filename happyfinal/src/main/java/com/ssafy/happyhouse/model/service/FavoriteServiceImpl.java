package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.mapper.FavoriteMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	SqlSession sqlsession;
	
	
	
	@Override
	public ArrayList<HouseDto> getFavoriteList(String userid) throws SQLException {
		return  sqlsession.getMapper(FavoriteMapper.class).getFavoriteList(userid);
	}

	@Override
	public void setFavoriteList(Map<String, String> map) throws SQLException {
		sqlsession.getMapper(FavoriteMapper.class).setFavoriteList(map);		
	}
}
