package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.GuestBookDto;

@Mapper
public interface GuestBookMapper {

	public void writeArticle(GuestBookDto guestBookDto) throws SQLException;
	public List<GuestBookDto> listArticle(int start, String key, String word) throws SQLException;
	
	public GuestBookDto getArticle(int articleno) throws SQLException;
	public void modifyArticle(GuestBookDto guestBookDto) throws SQLException;
	public void deleteArticle(int articleno) throws SQLException;
	
	public int getTotalCount(String key, String word) throws SQLException;
	
}
