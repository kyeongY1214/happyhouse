package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.FavoriteService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	
	@Autowired
	FavoriteService favoriteService;
	
	@PostMapping("/regist")
	public String regist(@RequestParam Map<String, String> map, HttpSession session, Model model) throws SQLException{
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		map.put("userid", memberDto.getUserId());
		favoriteService.setFavoriteList(map);
		System.out.println(map.toString());
		return "main";
	}
}
