package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.HouseDto;


public interface HouseMapper {
	
	ArrayList<HouseDto> getHouseList(Map<String, String> map)throws SQLException;//구군코드, 동이름
	
	ArrayList<HouseDto> getAptList(String aptName) throws SQLException;//구군코드, 동이름, 아파트 이름
	

}
