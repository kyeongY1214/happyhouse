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

	
	@PostMapping("/search")
	public String search(@RequestParam Map<String, String> map, Model model) throws SQLException{
		List<RetailDto> list = retailService.getRetail(map);
		model.addAttribute("retailList", list);
		System.out.println(list.toString());
		return "searchRetail";
	}
	
}
