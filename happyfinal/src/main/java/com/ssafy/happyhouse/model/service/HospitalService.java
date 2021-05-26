package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.model.util.PageNavigation;

public interface HospitalService {
	List<HospitalDto> getHosiptal(Map<String, String> map) throws SQLException;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
