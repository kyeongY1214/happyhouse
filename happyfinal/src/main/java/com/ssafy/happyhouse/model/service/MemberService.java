package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {

//	회원가입
	void registerMember(MemberDto memberDto);
//	로그인
	MemberDto login(Map<String, String> map);
//	회원정보 수정을 위한 회원의 모든 정보 얻기
	MemberDto getMember(String userId);
//	회원정보 수정
	void modifyMember(MemberDto memberDto); 
//	회원탈퇴
    void deleteMember(Map<String, String> map); 
// 	비밀번호 찾기
	MemberDto findpw(String userId, String userName, String email);
//	adminREST 
	public List<MemberDto> userList();
	public void userDelete(String userId);
	public List<String> getLikeArea(String userid);

}
