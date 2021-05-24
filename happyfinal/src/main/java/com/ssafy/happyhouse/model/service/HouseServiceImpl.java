package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.mapper.HouseMapper;


@Service
public class HouseServiceImpl implements HouseService {
	
	//추가
	@Autowired
	SqlSession sqlsession;

	@Override
	public ArrayList<HouseDto> getHouseList(String mydong) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).getHouseList(mydong);
	}

	@Override
	public ArrayList<HouseDto> getAptList(String aptName) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).getAptList(aptName);
	}

	@Override
	public List<HouseDto> chartList() throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).chartList();
	}
	@Override
	public List<HouseDto> lowchartList() throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).lowchartList();
	}

	@Override
	public List<HouseDto> guhiList(String gugun) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).guhiList(gugun);
	}

	@Override
	public List<HouseDto> gulowList(String gugun) throws SQLException {
		return sqlsession.getMapper(HouseMapper.class).gulowList(gugun);
	}

}
