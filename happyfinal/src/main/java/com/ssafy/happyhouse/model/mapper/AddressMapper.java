package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
public interface AddressMapper {
	
	List<String> getCity(String city)throws SQLException ;
	List<String> getGugun(String city)throws SQLException ;
	List<String> getDong(Map<String, String> map)throws SQLException ;	
}
