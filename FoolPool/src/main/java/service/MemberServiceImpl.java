package service;

import bean.Member;
import dao.MemberDAO;
import dao.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	MemberDAO m_dao = new MemberDAOImpl();
	public void joinMember(Member member) throws Exception {
		//
		Member mem = m_dao.selectMemberById(member.getId());
		if(mem != null) {
			throw new Exception("아이디 중복오류");
		}
		m_dao.insertMember(member);
	}
	@Override
	public Member login(String id, String password) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String idCheck(String id) throws Exception {
		Member member = m_dao.selectMemberById(id);
		if(member==null) {
			System.out.println("Member가 null?");
			return "notexist";
		}
		return "exist";
	}
	@Override
	public String nicknameCheck(String nickname) throws Exception {
		Member member = m_dao.selectMemberByNickname(nickname);
		if(member==null) {
			return "notexist";
		}
		return "exist";
	}

}
