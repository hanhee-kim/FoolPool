package service;

import bean.Member;

public interface MemberService {
	void joinMember(Member member) throws Exception;
	Member login(String id,String password) throws Exception;
	String loginCheck(String id,String password) throws Exception;	
	//ID중복체크
	String idCheck(String id) throws Exception;
	//NICKNAME중복체크
	String nicknameCheck(String nickname) throws Exception;
}
