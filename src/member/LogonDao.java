package member;

import java.util.Map;

public interface LogonDao {
	public int insertMember( LogonDataBean memberDto );		// 회원가입
	public int check( String id );							// 로그인
	public int check( String id, String passwd );			// 로그인
	public int deleteMember( String id );
	public LogonDataBean getMember( String id );
	public int updateMember( LogonDataBean logonDto );
	public String findId(String email);					// 아이디 찾기
	public String findPasswd(Map<String, String> map);	// 비밀번호 찾기
}
