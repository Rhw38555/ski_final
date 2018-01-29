package memo;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class MemoDBBean implements MemoDao{
	@Override
	public List<MemoDataBean> getMemo( Map<String, String> map ) {
		return SqlMapClient.getSqlSession().selectList( "Memo.getMemo", map );
	}
	@Override
	public MemoDataBean getMemoOne(Map<String, String> map) {
		return SqlMapClient.getSqlSession().selectOne( "Memo.getMemoOne", map );
	}
	@Override
	public int insertMemo(Map<String, String> map) {
		return SqlMapClient.getSqlSession().insert( "Memo.insertMemo", map );
	}
	
	@Override
	public int updateMemo(Map<String, String> map) {
		return SqlMapClient.getSqlSession().update( "Memo.updateMemo", map );
	}
	
	@Override
	public int deleteMemo(Map<String, String> map) {
		return SqlMapClient.getSqlSession().delete( "Memo.deleteMemo", map );
	}
}
