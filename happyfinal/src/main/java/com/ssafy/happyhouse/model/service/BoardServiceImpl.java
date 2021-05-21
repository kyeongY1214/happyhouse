package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.mapper.AddressMapper;
import com.ssafy.happyhouse.model.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	SqlSession sqlsession;

    @Override
	public List<BoardDto> retrieveBoard() {
		return sqlsession.getMapper(BoardMapper.class).selectBoard();
	}
    
  	@Override
	public boolean writeBoard(BoardDto board) {
		return  sqlsession.getMapper(BoardMapper.class).insertBoard(board) == 1;
	}

	@Override
	public BoardDto detailBoard(int no) {
		return  sqlsession.getMapper(BoardMapper.class).selectBoardByNo(no);
	}

	@Override
	@Transactional
	public boolean updateBoard(BoardDto board) {
		return  sqlsession.getMapper(BoardMapper.class).updateBoard(board) == 1;
	}

	@Override
	@Transactional
	public boolean deleteBoard(int no) {
		return sqlsession.getMapper(BoardMapper.class).deleteBoard(no) == 1;
	}
}