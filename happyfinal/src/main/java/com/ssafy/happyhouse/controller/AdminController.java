package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;


@RestController
@RequestMapping("/admin")
@CrossOrigin("*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberService memberService;
	
	//GetMapping("/user")
	@RequestMapping(value = "/user", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public  List<MemberDto>userList() {
		return memberService.userList();
	}
	
	
	@RequestMapping(value = "/user", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	public List<MemberDto> userRegister(@RequestBody MemberDto memberDto) {
		memberService.registerMember(memberDto);
		return memberService.userList();
	}
	
	@RequestMapping(value = "/user/{userid}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public MemberDto userInfo(@PathVariable("userid") String userid) {
		return memberService.getMember(userid);
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.PUT, headers = { "Content-type=application/json" })
	public List<MemberDto> userModify(@RequestBody MemberDto memberDto) {
		memberService.modifyMember(memberDto);
		return memberService.userList();
	}
	
	@RequestMapping(value = "/user/{userid}", method = RequestMethod.DELETE)
	public List<MemberDto> userDelete(@PathVariable("userid") String userid) {
		memberService.userDelete(userid);
		return memberService.userList();
	}
	
	@RequestMapping(value = "/like/{userid}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<String> likeAear(@PathVariable("userid") String userid) {
		List<String> list = memberService.getLikeArea(userid);
		System.out.println(list.get(0));
		return list;
	}
	
}
