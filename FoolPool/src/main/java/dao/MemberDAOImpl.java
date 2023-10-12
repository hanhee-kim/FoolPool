package dao;

import org.apache.ibatis.session.SqlSession;

import bean.Member;
import util.MybatisSqlSessionFactory;

public class MemberDAOImpl implements MemberDAO {
SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertMember(Member member) throws Exception {
		sqlSession.insert("mapper.member.insertMember", member);
		sqlSession.commit();
	}

}
