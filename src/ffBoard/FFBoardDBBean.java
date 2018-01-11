package ffBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class FFBoardDBBean implements FFBoardDao{
	
	// ��ü �� ���� �������� getCount
	@Override
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getCount" );
	}
	
	// �ü� �����Ͽ� �� ���� �������� getCount
	public int getCount( String division ) {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getCountDivision", division );
	}
	
	// ���ο� �� ����ϴ� insertAtricle
	@Override
	public int insertArticle(FFBoardDataBean ffDto) {
		
		return SqlMapClient.getSqlSession().insert( "ffBoard.insertArticle", ffDto );
	}
	
	// �� ��� �������� getArticles
	@Override
	public List<FFBoardDataBean> getArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "ffBoard.getArticles", map );
	}
	
	// �ü��� ��� �������� getDivisionArticle
	@Override
	public List<FFBoardDataBean> getDivisionArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "ffBoard.getDivisionArticles", map );
	}
	// �� �Ѱ��� ������ �������� getArticle
	@Override
	public FFBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getArticle", num );
	}
	
	// �� ������ �����ϴ� updateArticle
	@Override
	public int updateArticle(FFBoardDataBean ffDto) {
		return SqlMapClient.getSqlSession().update( "ffBoard.updateArticle", ffDto );
	}
	
	// ���� �����ϴ� deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "ffBoard.deleteArticle", num );
	}
}
