package com.ssafy.happyhouse.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.ssafy.happyhouse.model.NewsDto;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.model.util.NaverCrawler;

@RestController
@RequestMapping("/news")
@CrossOrigin("*")
public class NewsController {

	@RequestMapping(value = "/getNewsbudongsan", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<NewsDto> newsList() throws SQLException {

		String id = "N9MGUWM9Te0sYR4F1RPi";
		String secret = "q09x3rqGtd";
		List<NewsDto> newsList = new ArrayList<NewsDto>();
		try {
			NaverCrawler crawler = new NaverCrawler();
			String url = URLEncoder.encode("부동산 기사", "UTF-8");
			String response = crawler.search(id, secret, url);


			String[] fields = { "title", "link", "description" };
			Map<String, Object> result = crawler.getResult(response, fields);
			if (result.size() > 0)
				System.out.println("total -> " + result.get("total"));
			
			List<Map<String, Object>> items = (List<Map<String, Object>>) result.get("result");
			//5개만 출력할수있게 하기
			int index=1;
			for (Map<String, Object> item : items) {
				NewsDto newsDto = new NewsDto();
				for (String field : fields) {
					if (field == "title") {
						newsDto.setTitle(item.get(field).toString());
					} else if (field == "link") {
						newsDto.setLink(item.get(field).toString());
					} else if (field == "description") {
						newsDto.setDescription(item.get(field).toString());
					}
				}
				newsList.add(newsDto);
				
				if(index==5) {
					break;
				}
				index++;
			}
			System.out.println(newsList.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
	
	
	@RequestMapping(value = "/getNewsjutak", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<NewsDto> newsList2() throws SQLException {

		String id = "N9MGUWM9Te0sYR4F1RPi";
		String secret = "q09x3rqGtd";
		List<NewsDto> newsList = new ArrayList<NewsDto>();
		try {
			NaverCrawler crawler = new NaverCrawler();
			String url = URLEncoder.encode("주택 기사", "UTF-8");
			String response = crawler.search(id, secret, url);


			String[] fields = { "title", "link", "description" };
			Map<String, Object> result = crawler.getResult(response, fields);
			if (result.size() > 0)
				System.out.println("total -> " + result.get("total"));
			
			List<Map<String, Object>> items = (List<Map<String, Object>>) result.get("result");
			//5개만 출력할수있게 하기
			int index=1;
			for (Map<String, Object> item : items) {
				NewsDto newsDto = new NewsDto();
				for (String field : fields) {
					if (field == "title") {
						newsDto.setTitle(item.get(field).toString());
					} else if (field == "link") {
						newsDto.setLink(item.get(field).toString());
					} else if (field == "description") {
						newsDto.setDescription(item.get(field).toString());
					}
				}
				newsList.add(newsDto);
				
				if(index==5) {
					break;
				}
				index++;
			}
			System.out.println(newsList.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}


}
