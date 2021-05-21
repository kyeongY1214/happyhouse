package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDto;


public interface HouseService {
	//추가
	ArrayList<HouseDto> getHouseList(Map<String, String> map)throws SQLException;//구군코드, 동이름
	ArrayList<HouseDto> getAptList(String aptName) throws SQLException;//구군코드, 동이름, 아파트 이름
	
}
