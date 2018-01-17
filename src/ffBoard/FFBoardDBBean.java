package ffBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class FFBoardDBBean implements FFBoardDao{
	
	// 전체 글 개수 가져오는 getCount
	@Override
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getCount" );
	}
	
	// 시설 구분하여 글 개수 가져오는 getCount
	public int getCount( String division ) {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getCountDivision", division );
	}
	
	// 새로운 글 등록하는 insertAtricle
	@Override
	public int insertArticle(FFBoardDataBean ffDto) {
		
		return SqlMapClient.getSqlSession().insert( "ffBoard.insertArticle", ffDto );
	}
	
	// 글 목록 가져오는 getArticles
	@Override
	public List<FFBoardDataBean> getArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "ffBoard.getArticles", map );
	}
	
	// 시설별 목록 가져오는 getDivisionArticle
	@Override
	public List<FFBoardDataBean> getDivisionArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "ffBoard.getDivisionArticles", map );
	}
	// 글 한개의 내용을 가져오는 getArticle
	@Override
	public FFBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "ffBoard.getArticle", num );
	}
	
	// 글 정보를 수정하는 updateArticle
	@Override
	public int updateArticle(FFBoardDataBean ffDto) {
		return SqlMapClient.getSqlSession().update( "ffBoard.updateArticle", ffDto );
	}
	
	// 글을 삭제하는 deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "ffBoard.deleteArticle", num );
	}
}
