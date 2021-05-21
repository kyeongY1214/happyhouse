package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.HouseMapper;
import com.ssafy.happyhouse.model.HouseDto;


@Service
public class HouseServiceImpl implements HouseService {
	
	//추가
	@Autowired
	SqlSession sqlsession;

	@Override
	public ArrayList<HouseDto> getHouseList(Map<String, String> map) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).getHouseList(map);
	}

	@Override
	public ArrayList<HouseDto> getAptList(String aptName) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).getAptList(aptName);
	}

}
