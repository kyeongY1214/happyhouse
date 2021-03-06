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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.MemberService;
import com.ssafy.happyhouse.model.service.FavoriteService;

@Controller
@RequestMapping("/house")
public class HouseController {
	
	@Autowired
	HouseService houseService;

	
	@PostMapping("/search")
	public String search(@RequestParam Map<String, String> map, Model model) throws SQLException{
		String dong = map.get("mydong");
		List<HouseDto> list = houseService.getHouseList(dong);
		model.addAttribute("houseList", list);
		return "searchHouse";
	}
	
	@GetMapping("/search/{dong}")
	public String searchList(@PathVariable("dong") String dong, Model model) throws SQLException{
		List<HouseDto> list = houseService.getHouseList(dong);
		model.addAttribute("houseList", list);
		return "searchHouse";
	}
	
	@GetMapping("/{aptName}")
	public String search(@PathVariable("aptName") String aptName, Model model) throws SQLException{
		List<HouseDto> list = houseService.getAptList(aptName);
		//replace
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPrice(list.get(i).getPrice().replace(",", ""));
		}
		model.addAttribute("aptList", list);
		System.out.println(list.get(0).getPrice());
		System.out.println(list.toString());
		return "searchApt";
	}
	
}
