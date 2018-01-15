package eventBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class EventBoardDBBean implements EventBoardDao{
	// 전체 글 개수 가져오는 getCount
	@Override
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne( "eventBoard.getCount" );
	}
	
	// 새로운 글 등록하는 insertAtricle
	@Override
	public int insertArticle(EventBoardDataBean eventDto) {
		
		return SqlMapClient.getSqlSession().insert( "eventBoard.insertArticle", eventDto );
	}
	
	// 글 목록 가져오는 getArticles
	@Override
	public List<EventBoardDataBean> getArticles(Map<String, Integer> map) {
		return SqlMapClient.getSqlSession().selectList( "eventBoard.getArticles", map );
	}
	
	// 글 한개의 내용을 가져오는 getArticle
	@Override
	public EventBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "eventBoard.getArticle", num );
	}
	
	// 글 정보를 수정하는 updateArticle
	@Override
	public int updateArticle(EventBoardDataBean eventDto) {
		return SqlMapClient.getSqlSession().update( "eventBoard.updateArticle", eventDto );
	}
	
	// 글을 삭제하는 deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "eventBoard.deleteArticle", num );
	}
}
