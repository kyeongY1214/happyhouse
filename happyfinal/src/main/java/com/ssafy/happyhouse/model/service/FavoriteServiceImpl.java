package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.happyhouse.model.mapper.FavoriteMapper;
import com.ssafy.model.util.PageNavigation;


@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public ArrayList<HouseDto> getFavoriteList(Map<String, String> map) throws SQLException {
		
		return  sqlsession.getMapper(FavoriteMapper.class).getFavoriteList(map);
	}

	@Override
	public void setFavoriteList(Map<String, String> map) throws SQLException {
		sqlsession.getMapper(FavoriteMapper.class).setFavoriteList(map);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = 1;
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
	
	

}
