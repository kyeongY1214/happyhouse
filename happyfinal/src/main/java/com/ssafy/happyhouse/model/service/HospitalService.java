package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HospitalDto;

public interface HospitalService {
	List<HospitalDto> getHosiptal(String userid) throws SQLException;
}
