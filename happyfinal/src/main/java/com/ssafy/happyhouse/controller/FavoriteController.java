package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.FavoriteService;
import com.ssafy.happyhouse.model.service.HospitalService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	
	@Autowired
	FavoriteService favoriteService;
	
	@Autowired
	HospitalService hospitalService;
	
	@PostMapping("/regist")
	public String regist(@RequestParam Map<String, String> map, HttpSession session, Model model) throws SQLException{
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		map.put("userid", memberDto.getUserId());
		favoriteService.setFavoriteList(map);
		return "main";
	}

	@RequestMapping("/mvfav")
	public String mvMember(HttpSession session, Model model) throws SQLException {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		List<HouseDto> list = favoriteService.getFavoriteList(memberDto.getUserId());
		List<HospitalDto> hospital = hospitalService.getHosiptal(memberDto.getUserId());
		System.out.println(hospital.toString());
		model.addAttribute("houseList", list);
		model.addAttribute("hospitalList", hospital);
		return "favorite";
	}
	
}
