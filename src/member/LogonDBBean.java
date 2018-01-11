package member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class LogonDBBean implements LogonDao {
	// 아이디별 번호
	
		public int numcheck(String id, String passwd) {
			int num = -1;
			int count = check(id);
			if( count!=0 ) {
				LogonDataBean logonDto = getMember(id);
				
				if( passwd.equals( logonDto.getPasswd() ) ) {
					num = SqlMapClient.getSqlSession().selectOne("Member.numcheck", id);
				} else {
					num = -1;
				}				
			} else {
				num = -2;
			}			
			return num;
		}
		
		// 회원가입
		public int insertMember( LogonDataBean logonDto ) {
			int result = 0;
			result = SqlMapClient.getSqlSession().insert("Member.insertMember", logonDto);
			
			return result;
		}
		// 로그인
		public int check( String id ) {
			int result = 0;
			int count = SqlMapClient.getSqlSession().selectOne("Member.check", id);
			if( count!=0 ) {
					result = 1;
				} else {
					result = 0;
				}			
			return result;
		}
		
		// 로그인
		public int check( String id, String passwd ) {
			int result = 0;
			int count = check(id);
			if( count!=0 ) {
				LogonDataBean logonDto = getMember(id);
				
				if( passwd.equals( logonDto.getPasswd() ) ) {
					result = 1;
				} else {
					result = -1;
				}				
			} else {
				result = 0;
			}			
			
			return result;
		}

		
		public int deleteMember( String id ) {
			return SqlMapClient.getSqlSession().delete("Member.deleteMember", id);
		}
		
		public LogonDataBean getMember( String id ) {
			return SqlMapClient.getSqlSession().selectOne("Member.getMember", id);
		}

		public int updateMember( LogonDataBean logonDto ) {
			int result = 0;
			result = SqlMapClient.getSqlSession().update("Member.updateMember", logonDto);
			return result;
		}

		public String findId(String email) {
			String id="nonId";
			id = SqlMapClient.getSqlSession().selectOne("Member.findId", email);
			return id;
		}

		public String findPasswd(Map<String, String> map) {
			String passwd="nonPasswd";
			passwd = SqlMapClient.getSqlSession().selectOne("Member.findPasswd", map);
			return passwd;
		}	
		
		
} // class















