package dao;

import bean.Member;

public interface MemberDAO {
	void insertMember(Member member) throws Exception;
	Member selectMemberById(String id) throws Exception;
	Member selectMemberByNickname(String id) throws Exception;
}
