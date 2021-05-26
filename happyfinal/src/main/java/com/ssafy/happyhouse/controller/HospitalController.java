package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.RetailDto;
import com.ssafy.happyhouse.model.service.HospitalService;
import com.ssafy.model.util.PageNavigation;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@Autowired
	HospitalService hospitalService; 
	
	@RequestMapping("/mvcorona")
	public String mvsearch(@RequestParam Map<String, String> map, Model model) throws SQLException{
		return "searchCorona";
	}
	
	
	
	@GetMapping("/search")
	public String search(@RequestParam Map<String, String> map, Model model) throws Exception{
		String spp = map.get("spp");
		String pg = map.get("pg");
		
		System.out.println("mydong : " + map.get("mydong"));
		
		map.put("spp", spp != null ? spp : "5");//sizePerPage
		map.put("pg", pg != null ? pg : "1");//pg
		
		
		System.out.println( "SPP :" + spp + "PG : " + pg);
		System.out.println( "controller" + " : " + map.get("pg"));
		
		List<HospitalDto> list = hospitalService.getHosiptal(map);
		PageNavigation pageNavigation = hospitalService.makePageNavigation(map);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("hospitalList", list);
		System.out.println(list.toString());
		return "searchCorona";
	}
}
