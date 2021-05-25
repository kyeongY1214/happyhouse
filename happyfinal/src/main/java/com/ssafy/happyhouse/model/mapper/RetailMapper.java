package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.RetailDto;


@Mapper
public interface RetailMapper {
	List<RetailDto> getRetail(Map<String, Object> map) throws SQLException ;
	public int getTotalCount(Map<String, String> map) throws SQLException;
}
