package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.MemberMapper;
import com.ssafy.happyhouse.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void registerMember(MemberDto memberDto) {
		sqlsession.getMapper(MemberMapper.class).registerMember(memberDto);
	}

	@Override
	public MemberDto login(Map<String, String> map) {
		return sqlsession.getMapper(MemberMapper.class).login(map);
	}

	@Override
	public MemberDto getMember(String userId) {
		
		return sqlsession.getMapper(MemberMapper.class).getMember(userId);
	}

	@Override
	public void modifyMember(MemberDto memberDto) throws SQLException {
		sqlsession.getMapper(MemberMapper.class).modifyMember(memberDto);
	}

	@Override
    public void deleteMember(Map<String, String> map) throws SQLException {
		sqlsession.getMapper(MemberMapper.class).deleteMember(map);
    }
	
	@Override
	public MemberDto findpw(String userId, String userName, String email) {
		return null;
	}


}
