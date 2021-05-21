package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.model.util.PageNavigation;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSession sqlsession;
	

	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		if(noticeDto.getSubject() == null || noticeDto.getContent() == null) {
			throw new Exception();
		}
		sqlsession.getMapper(NoticeMapper.class).writeNotice(noticeDto);
	}


	@Override
	public NoticeDto getNotice(int noticeno) throws Exception {
		return sqlsession.getMapper(NoticeMapper.class).getNotice(noticeno);
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		sqlsession.getMapper(NoticeMapper.class).modifyNotice(noticeDto);
	}

	@Override
	public void deleteNotice(int noticeno) throws Exception {
		sqlsession.getMapper(NoticeMapper.class).deleteNotice(noticeno);
	}



	@Override
	public List<NoticeDto> listNotice(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return sqlsession.getMapper(NoticeMapper.class).listNotice(param);
	}



	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception  {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlsession.getMapper(NoticeMapper.class).getTotalCount(map);
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
