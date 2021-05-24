package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.HouseService;

@RestController
@RequestMapping("/chart")
@CrossOrigin("*")
public class ChartController {
	
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/mkchart", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<HouseDto> chartList() throws SQLException {
		return houseService.chartList();
	}
	
}
