package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.HouseDto;

@Mapper
public interface HouseMapper {
	
	ArrayList<HouseDto> getHouseList(Map<String, String> map)throws SQLException;//구군코드, 동이름
	
	ArrayList<HouseDto> getAptList(String aptName) throws SQLException;//구군코드, 동이름, 아파트 이름

	List<HouseDto> chartList() throws SQLException;

	List<HouseDto> lowchartList() throws SQLException;
	

}
