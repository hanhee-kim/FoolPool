package service;

import bean.Member;
import dao.MemberDAO;
import dao.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	MemberDAO m_dao = new MemberDAOImpl();
	public void joinMember(Member member) throws Exception {
		m_dao.insertMember(member);
	}

}
