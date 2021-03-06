package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.PortableServer.POA;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller 
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping("/mvregister")
	public String mvMember() {
		return "join";
	}
	
	@RequestMapping("/mvboard")
	public String mvBoard() {
		return "board";
	}
	
	//회원 CRUD
	
	@PostMapping("/regist")
	public String memberRegister(MemberDto memberdto) {
		memberservice.registerMember(memberdto);
		return "main";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response){
	
		MemberDto memberDto = memberservice.login(map);
		
		System.out.println(memberDto.toString());
		if(memberDto != null) {
			List<String> favoriteList = memberservice.getLikeArea(memberDto.getUserId());
			session.setAttribute("userinfo", memberDto);
			session.setAttribute("favoriteArea", favoriteList);
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
		}
		
		System.out.println(memberDto.toString());
		return "main";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/modify")
	public String memberModify(@RequestParam Map<String, String> map, Model model,HttpSession session) throws SQLException
	{
		System.out.println("modify!!!!");
		String id = map.get("info_id");
		String pwd = map.get("info_pw");
		String address = map.get("info_address");
		System.out.println(address);
		MemberDto member = memberservice.getMember(id);
		
		System.out.println("modify"+" "+member.toString());
		member.setUserPwd(pwd);
		member.setAddress(address);
		memberservice.modifyMember(member);
		session.invalidate();
		
		return "main";
	}
	
	@PostMapping("/delete")
	public String delmember(@RequestParam Map<String, String> map, Model model,HttpSession session)
	{
		memberservice.deleteMember(map);
		session.invalidate();
		return "main";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "userlist";
	}
	
}
