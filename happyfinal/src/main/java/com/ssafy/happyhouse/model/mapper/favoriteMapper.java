package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.HouseDto;

@Mapper
public interface favoriteMapper {
	ArrayList<HouseDto> getFavoriteList(String userid) throws SQLException;

	void setFavoriteList(String userid,String city, String gugun, String dong) throws SQLException;
	
}
