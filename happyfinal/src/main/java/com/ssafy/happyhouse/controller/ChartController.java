package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/mkhichart", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<HouseDto> chartList() throws SQLException {
		return houseService.chartList();
	}
	
	@RequestMapping(value = "/mklowchart", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<HouseDto> lowchartList() throws SQLException {
		return houseService.lowchartList();
	}
	
	@RequestMapping(value = "/gugunhi/{gugun}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<HouseDto> guhichartList(@PathVariable("gugun") String gugun) throws SQLException {
		return houseService.guhiList(gugun);
	}
	
	@RequestMapping(value = "/gugunlow/{gugun}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<HouseDto> gulowchartList(@PathVariable("gugun") String gugun) throws SQLException {
		return houseService.gulowList(gugun);
	}
	
}
