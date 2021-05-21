package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.NoticeDto;

@Mapper
public interface NoticeMapper {

	public void writeArticle(NoticeDto guestBookDto) throws SQLException;
	public List<NoticeDto> listArticle(int start, String key, String word) throws SQLException;
	
	public NoticeDto getArticle(int articleno) throws SQLException;
	public void modifyArticle(NoticeDto guestBookDto) throws SQLException;
	public void deleteArticle(int articleno) throws SQLException;
	
	public int getTotalCount(String key, String word) throws SQLException;
	
}
