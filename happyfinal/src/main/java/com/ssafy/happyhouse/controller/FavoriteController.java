package com.ssafy.happyhouse.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	
	@RequestMapping("/set")
	public String setArea(@RequestParam Map<String, String> map, Model model)
	{
		
		return "main";
	}
}
