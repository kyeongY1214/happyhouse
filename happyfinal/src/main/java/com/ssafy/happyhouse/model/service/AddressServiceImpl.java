package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.mapper.AddressMapper;


@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<String> getCity(String city) throws SQLException {
		return sqlsession.getMapper(AddressMapper.class).getCity(city);
	}

	@Override
	public List<String> getGugun(String city) throws SQLException {
		return sqlsession.getMapper(AddressMapper.class).getGugun(city);
	}

	@Override
	public List<String> getDong(Map<String, String> map) throws SQLException {
		return sqlsession.getMapper(AddressMapper.class).getDong(map);
	}

}
