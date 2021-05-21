package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.model.util.PageNavigation;



public interface NoticeService {

	public void writeNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> listNotice(int pg, String key, String word) throws Exception;
	public PageNavigation makeNavigator(int pg, String key, String word) throws Exception;
	
	public NoticeDto getNotice(int articleno) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int noticeno) throws Exception;
	
}
