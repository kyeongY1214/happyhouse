package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.HouseDto;

@Mapper
public interface FavoriteMapper {
	
	ArrayList<HouseDto> getFavoriteList(String userid) throws SQLException;
	void setFavoriteList(Map<String, String> map) throws SQLException;
	
}