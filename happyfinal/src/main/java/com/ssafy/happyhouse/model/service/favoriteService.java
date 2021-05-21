package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.happyhouse.model.HouseDto;
import com.ssafy.model.util.PageNavigation;

public interface favoriteService {
	void setFavoriteList(String userid, String city, String dong, String gugun) throws SQLException;
	
	ArrayList<HouseDto> getFavoriteList(String userid)throws SQLException;
	
	/*public List<GuestBookDto> listArticle(int pg, String key, String word) throws Exception;
	public PageNavigation makeNavigator(int pg, String key, String word) throws Exception;

	*/
}
