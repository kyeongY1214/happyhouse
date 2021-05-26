package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.mapper.FavoriteMapper;
import com.ssafy.model.util.PageNavigation;


@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public ArrayList<HouseDto> getFavoriteList(Map<String, String> map) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		int currentPage = 1;
		if(map.get("pg") == null)
		{
			System.out.println("pg가 null값입니다...");
			
		}
		else
		{
			 currentPage = Integer.parseInt(map.get("pg"));
		}
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("userid",map.get("userid"));
		System.out.println("service" + " : " + sqlsession.getMapper(FavoriteMapper.class).getFavoriteList(param).size());
		return  sqlsession.getMapper(FavoriteMapper.class).getFavoriteList(param);
	}

	@Override
	public void setFavoriteList(Map<String, String> map) throws SQLException {
		sqlsession.getMapper(FavoriteMapper.class).setFavoriteList(map);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlsession.getMapper(FavoriteMapper.class).getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
		
		
	}


	@Override
	public void reset(String userid) throws SQLException {
		sqlsession.getMapper(FavoriteMapper.class).reset(userid);
		
	}
	
	

}
