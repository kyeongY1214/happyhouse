package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.RetailDto;
import com.ssafy.model.util.PageNavigation;


public interface RetailService {
	List<RetailDto> getRetail(Map<String, String> map) throws SQLException;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
