package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.service.AddressService;
import com.ssafy.happyhouse.model.service.AddressServiceImpl;

@RestController
@RequestMapping(value="/address")
public class AddressController {
	
	@Autowired
	AddressService addressServiceImpl;
	
	@RequestMapping(value = "/getgu", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	public List<String> getGu(@RequestBody String city) throws SQLException {
		List<String> gulist = addressServiceImpl.getCity(city);
		System.out.println(gulist.toString());
		return gulist;
	}
	
	@RequestMapping(value = "/getdong", method = RequestMethod.POST, headers = { "Content-type=application/json;charset=utf-8" })
	public List<String> getDong(@RequestBody Map<String, String> map) throws SQLException {
		List<String> donglist = addressServiceImpl.getDong(map);
		System.out.println(donglist.toString());
		return donglist;
	}
	
	@RequestMapping(value = "/getkind", method = RequestMethod.POST, headers = { "Content-type=application/json;charset=utf-8" })
	public List<String> getKind(@RequestBody Map<String, String> map) throws SQLException {
		List<String> kindlist = addressServiceImpl.getKind(map);
		System.out.println(map.toString());
		System.out.println(kindlist.toString());
		return kindlist;
	}
	

}
