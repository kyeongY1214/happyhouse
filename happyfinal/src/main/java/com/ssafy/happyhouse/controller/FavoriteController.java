package com.ssafy.happyhouse.controller;

import java.lang.reflect.Member;
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
import com.ssafy.happyhouse.model.service.MemberService;
import com.ssafy.model.util.PageNavigation;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	
	@Autowired
	FavoriteService favoriteService;
	
	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	MemberService memberService;
	
	
	@PostMapping("/regist")
	public String regist(@RequestParam Map<String, String> map, HttpSession session, Model model) throws SQLException{
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		map.put("userid", memberDto.getUserId());
		favoriteService.setFavoriteList(map);
		List<String> favoriteList = memberService.getLikeArea(memberDto.getUserId());
		session.setAttribute("favoriteArea", favoriteList);
		return "main";
	}

	@RequestMapping("/mvfav")
	public String mvMember(HttpSession session, @RequestParam Map<String, String> map, Model model) throws Exception {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		String spp = map.get("spp");
		String pg = map.get("pg");
		System.out.println( "SPP :" + spp + "PG : " + pg);
		System.out.println( "controller" + " : " + map.get("pg"));
		
		map.put("spp", spp != null ? spp : "5");//sizePerPage
		map.put("pg", pg != null ? pg : "1");//pg
		
		map.put("userid",memberDto.getUserId());
		
		List<HouseDto> list = favoriteService.getFavoriteList(map);
		PageNavigation pageNavigation = favoriteService.makePageNavigation(map);
		model.addAttribute("navigation", pageNavigation);
	
		model.addAttribute("houseList", list);
		
		System.out.println(list.size());
		
		return "favorite";
	}
	

	@RequestMapping("/reset")
	public String reset(HttpSession session, Model model) throws Exception {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		favoriteService.reset(memberDto.getUserId());
		List<String> favoriteList = memberService.getLikeArea(memberDto.getUserId());
		session.setAttribute("favoriteArea", favoriteList);
		return "main";
	}
	
	
}
