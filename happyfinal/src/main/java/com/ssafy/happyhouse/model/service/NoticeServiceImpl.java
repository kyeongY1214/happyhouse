package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.model.util.PageConstance;
import com.ssafy.model.util.PageNavigation;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	SqlSession sqlsession;
	

	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		if(noticeDto.getSubject() == null || noticeDto.getContent() == null) {
			throw new Exception();
		}
		//write
	}

	@Override
	public List<NoticeDto> listNotice(int pg, String key, String word) throws Exception {
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
	public NoticeDto getNotice(int articleno) throws Exception {
		return null;
	}

	@Override
	public void modifyNotice(NoticeDto guestBookDto) throws Exception {
		
	}

	@Override
	public void deleteNotice(int articleno) throws Exception {
		
	}

}
