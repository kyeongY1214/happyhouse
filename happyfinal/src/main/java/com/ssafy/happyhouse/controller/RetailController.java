package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.RetailDto;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.MemberService;
import com.ssafy.happyhouse.model.service.RetailService;
import com.ssafy.model.util.PageNavigation;
import com.ssafy.happyhouse.model.service.AddressService;
import com.ssafy.happyhouse.model.service.FavoriteService;

@Controller
@RequestMapping("/retail")
public class RetailController {


	@RequestMapping("/mvretail")
	public String mvsearch(@RequestParam Map<String, String> map, Model model) throws SQLException{
		return "searchRetail";
	}
	
	@Autowired
	RetailService retailService;

	
	@GetMapping("/search")
	public String search(@RequestParam Map<String, String> map, Model model) throws Exception{
		String spp = map.get("spp");
		String pg = map.get("pg");
		
		System.out.println("mydong : " + map.get("mydong"));
		
		map.put("spp", spp != null ? spp : "5");//sizePerPage
		map.put("pg", pg != null ? pg : "1");//pg
		
		
		System.out.println( "SPP :" + spp + "PG : " + pg);
		System.out.println( "controller" + " : " + map.get("pg"));
		
		List<RetailDto> list = retailService.getRetail(map);
		PageNavigation pageNavigation = retailService.makePageNavigation(map);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("retailList", list);
		
		System.out.println(list.toString());
		return "searchRetail";
	}
	
}
