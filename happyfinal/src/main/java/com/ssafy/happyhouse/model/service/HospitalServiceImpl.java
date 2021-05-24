package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.mapper.HospitalMapper;


@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<HospitalDto> getHosiptal(String userid) throws SQLException {
		return sqlsession.getMapper(HospitalMapper.class).getHosiptal(userid);
	}
}
