package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.model.util.PageNavigation;



public interface NoticeService {

	public void writeNotice(NoticeDto noticeDto) throws Exception;
	public  List<NoticeDto> listNotice(Map<String, String> map) throws Exception;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	
	public NoticeDto getNotice(int articleno) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int noticeno) throws Exception;
	
	
}
