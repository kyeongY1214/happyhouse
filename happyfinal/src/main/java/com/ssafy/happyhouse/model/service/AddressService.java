package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface AddressService {
	List<String> getCity(String city)throws SQLException ;
	List<String> getGugun(String city)throws SQLException ;
	List<String> getDong(Map<String, String> map)throws SQLException ;
}
