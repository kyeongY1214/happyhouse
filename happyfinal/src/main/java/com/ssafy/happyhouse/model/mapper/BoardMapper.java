package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.ssafy.happyhouse.model.BoardDto;

@Mapper
public interface BoardMapper {
	public List<BoardDto> selectBoard();
	public BoardDto selectBoardByNo(int no);
	public int insertBoard(BoardDto board);
	public int updateBoard(BoardDto board);
	public int deleteBoard(int no);
}