package qnaBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class QnaBoardDBBean implements QnaBoardDao{
	// 전체 글 개수 가져오는 getCountAdmin
	@Override
	public int getCountAdmin() {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCountAdmin" );
	}
	
	// 상태별 글 개수 가져오는 getCountStatus
	@Override
	public int getCountStatus(String current_status) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCountStatus", current_status );
	}
	
	// 해당 유저 글 개수 가져오는 getCount
	@Override
	public int getCount(String id) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCount", id );
	}
	
	// 새로운 글 등록하는 insertAtricle
	@Override
	public int insertArticle(QnaBoardDataBean qnaDto) {
		
		return SqlMapClient.getSqlSession().insert( "qnaBoard.insertArticle", qnaDto );
	}
	
	// 내 글 목록 가져오는 getMyArticles
	@Override
	public List<QnaBoardDataBean> getArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticles", map );
	}
	
	// 글 목록 가져오는 getArticles
	@Override
	public List<QnaBoardDataBean> getArticlesAdmin(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticlesAdmin", map );
	}
	// 상태에 따른 글 목록 가져오는 getArticlesStatus
	@Override
	public List<QnaBoardDataBean> getArticlesStatus(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticlesStatus", map );
	}
	
	// 글 한개의 내용을 가져오는 getArticle
	@Override
	public QnaBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getArticle", num );
	}
	
	// 글 정보를 유저가 수정하는 updateUserArticle
	@Override
	public int updateUserArticle(QnaBoardDataBean qnaDto) {
		return SqlMapClient.getSqlSession().update( "qnaBoard.updateArticle", qnaDto );
	}
	
	// 글 조회 시 처리중으로 변경하는 changeCurrentStatus
	@Override
	public void changeCurrentStatus(int num) {
		SqlMapClient.getSqlSession().update( "qnaBoard.changeCurrentStatus", num );
	}
	
	// 글에 답변을 다는 updateAnswerArticle
	@Override
	public int updateAnswerArticle( Map<String, Object> map ) {
		return SqlMapClient.getSqlSession().update( "qnaBoard.updateAnswerArticle", map );
	}
	
	// 글을 삭제하는 deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "qnaBoard.deleteArticle", num );
	}
}