package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.model.util.PageNavigation;

public interface FavoriteService {
	
	
	void setFavoriteList(Map<String, String> map) throws SQLException;
	ArrayList<HouseDto> getFavoriteList(String userid)throws SQLException;
	
}
