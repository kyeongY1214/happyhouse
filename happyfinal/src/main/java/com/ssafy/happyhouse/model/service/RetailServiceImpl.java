package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.RetailDto;
import com.ssafy.happyhouse.model.mapper.RetailMapper;



@Service
public class RetailServiceImpl implements RetailService {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<RetailDto> getRetail(Map<String, String> map) throws SQLException {
		return  sqlsession.getMapper(RetailMapper.class).getRetail(map);
	}
	
	
}
