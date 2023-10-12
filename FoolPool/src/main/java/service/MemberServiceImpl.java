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
		Member member = m_dao.selectMemberById(id);
		// 세션에 비밀번호는 저장하지 않기 위해 컨트롤러로 리턴할 Member객체에서 password는 지운다
		member.setPassword(null); 
		return member;
	}
	
	@Override
	public String loginCheck(String id, String password) throws Exception {
		Member member = m_dao.selectMemberById(id);
		String result = "";
		if(member==null) { //아이디 다르면
			result = "noId";
		}
		if(!member.getPassword().equals(password)) { //pw 다르면
			result = "noPW";
		}
		return result;
	}
	
	@Override
	public String idCheck(String id) throws Exception {
		Member member = m_dao.selectMemberById(id);
		if(member==null) {
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
