package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.GuestBookDto;
import com.ssafy.model.util.PageNavigation;



public interface GuestBookService {

	public void writeArticle(GuestBookDto guestBookDto) throws Exception;
	public List<GuestBookDto> listArticle(int pg, String key, String word) throws Exception;
	public PageNavigation makeNavigator(int pg, String key, String word) throws Exception;
	
	public GuestBookDto getArticle(int articleno) throws Exception;
	public void modifyArticle(GuestBookDto guestBookDto) throws Exception;
	public void deleteArticle(int articleno) throws Exception;
	
}
