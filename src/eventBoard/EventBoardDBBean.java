package eventBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class EventBoardDBBean implements EventBoardDao{
	// ��ü �� ���� �������� getCount
	@Override
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne( "eventBoard.getCount" );
	}
	
	// ���ο� �� ����ϴ� insertAtricle
	@Override
	public int insertArticle(EventBoardDataBean eventDto) {
		
		return SqlMapClient.getSqlSession().insert( "eventBoard.insertArticle", eventDto );
	}
	
	// �� ��� �������� getArticles
	@Override
	public List<EventBoardDataBean> getArticles(Map<String, Integer> map) {
		return SqlMapClient.getSqlSession().selectList( "eventBoard.getArticles", map );
	}
	
	// �� �Ѱ��� ������ �������� getArticle
	@Override
	public EventBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "eventBoard.getArticle", num );
	}
	
	// �� ������ �����ϴ� updateArticle
	@Override
	public int updateArticle(EventBoardDataBean eventDto) {
		return SqlMapClient.getSqlSession().update( "eventBoard.updateArticle", eventDto );
	}
	
	// ���� �����ϴ� deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "eventBoard.deleteArticle", num );
	}
}
