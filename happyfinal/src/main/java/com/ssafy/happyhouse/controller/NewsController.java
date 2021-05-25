package com.ssafy.happyhouse.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.model.util.NaverCrawler;

@RestController
@RequestMapping("/news")
@CrossOrigin("*")
public class NewsController {

	@RequestMapping(value = "/getNews", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<String> newsList() throws SQLException {

		String id = "N9MGUWM9Te0sYR4F1RPi";
		String secret = "q09x3rqGtd";
		try {
			NaverCrawler crawler = new NaverCrawler();
			String url = URLEncoder.encode("부동산", "UTF-8");
			String response = crawler.search(id, secret, url);
			System.out.println(response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
