package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDto;


public interface HouseService {
	//추가
	ArrayList<HouseDto> getHouseList(String mydong)throws SQLException;//구군코드, 동이름
	ArrayList<HouseDto> getAptList(String aptName) throws SQLException;//구군코드, 동이름, 아파트 이름
	List<HouseDto> chartList() throws SQLException;
	List<HouseDto> lowchartList()throws SQLException;
	
	List<HouseDto> guhiList(String gugun) throws SQLException;
	List<HouseDto> gulowList(String gugun)throws SQLException;
	
}
