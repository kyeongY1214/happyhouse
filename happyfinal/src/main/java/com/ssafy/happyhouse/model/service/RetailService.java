package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.RetailDto;


public interface RetailService {
	List<RetailDto> getRetail(Map<String, String> map) throws SQLException;
}
