package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.HospitalDto;


@Mapper
public interface HospitalMapper {
	List<HospitalDto> getHosiptal(String userid) throws SQLException ;
}
