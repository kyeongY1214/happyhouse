package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.GuestBookDto;
import com.ssafy.model.util.PageConstance;
import com.ssafy.model.util.PageNavigation;


@Service
public class GuestBookServiceImpl implements GuestBookService {
	
	@Autowired
	SqlSession sqlsession;
	

	@Override
	public void writeArticle(GuestBookDto guestBookDto) throws Exception {
		if(guestBookDto.getSubject() == null || guestBookDto.getContent() == null) {
			throw new Exception();
		}
		//write
	}

	@Override
	public List<GuestBookDto> listArticle(int pg, String key, String word) throws Exception {
		int start = (pg - 1) * PageConstance.LIST_SIZE;
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return null;
	}
	
	public PageNavigation makeNavigator(int pg, String key, String word) throws Exception {
		int naviSize = PageConstance.NAVI_SIZE;
		PageNavigation navigation = new PageNavigation();
		//int totalCount = guestBookDao.getTotalCount(key, word);
		//navigation.setTotalCount(totalCount);
		//int totalPageCount = (totalCount - 1) / PageConstance.LIST_SIZE + 1;
//		navigation.setTotalPageCount(totalPageCount);
//		navigation.setCurrentPage(pg);
//		navigation.setNaviSize(naviSize);
//		navigation.setStartRange(pg <= naviSize);
//		navigation.setEndRange((totalPageCount - 1) / naviSize * naviSize < pg);
//		navigation.makeNavigator();
		return navigation;
	}

	@Override
	public GuestBookDto getArticle(int articleno) throws Exception {
		return null;
	}

	@Override
	public void modifyArticle(GuestBookDto guestBookDto) throws Exception {
		
	}

	@Override
	public void deleteArticle(int articleno) throws Exception {
		
	}

}
