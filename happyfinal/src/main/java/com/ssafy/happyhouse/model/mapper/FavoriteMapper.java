package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDto;

@Mapper
public interface FavoriteMapper {
	
	ArrayList<HouseDto> getFavoriteList(Map<String, Object> map) throws SQLException;
	void setFavoriteList(Map<String, String> map) throws SQLException;
	ArrayList<FavoriteDto> getMyFavorite(String userid) throws SQLException;
	public int getTotalCount(Map<String, String> map) throws SQLException;
	void reset(String userid) throws SQLException;

}
