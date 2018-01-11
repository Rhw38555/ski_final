package qnaBoard;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class QnaBoardDBBean implements QnaBoardDao{
	// ��ü �� ���� �������� getCountAdmin
	@Override
	public int getCountAdmin() {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCountAdmin" );
	}
	
	// ���º� �� ���� �������� getCountStatus
	@Override
	public int getCountStatus(String current_status) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCountStatus", current_status );
	}
	
	// �ش� ���� �� ���� �������� getCount
	@Override
	public int getCount(String id) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getCount", id );
	}
	
	// ���ο� �� ����ϴ� insertAtricle
	@Override
	public int insertArticle(QnaBoardDataBean qnaDto) {
		
		return SqlMapClient.getSqlSession().insert( "qnaBoard.insertArticle", qnaDto );
	}
	
	// �� �� ��� �������� getMyArticles
	@Override
	public List<QnaBoardDataBean> getArticles(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticles", map );
	}
	
	// �� ��� �������� getArticles
	@Override
	public List<QnaBoardDataBean> getArticlesAdmin(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticlesAdmin", map );
	}
	// ���¿� ���� �� ��� �������� getArticlesStatus
	@Override
	public List<QnaBoardDataBean> getArticlesStatus(Map<String, Object> map) {
		return SqlMapClient.getSqlSession().selectList( "qnaBoard.getArticlesStatus", map );
	}
	
	// �� �Ѱ��� ������ �������� getArticle
	@Override
	public QnaBoardDataBean getArticle(int num) {
		return SqlMapClient.getSqlSession().selectOne( "qnaBoard.getArticle", num );
	}
	
	// �� ������ ������ �����ϴ� updateUserArticle
	@Override
	public int updateUserArticle(QnaBoardDataBean qnaDto) {
		return SqlMapClient.getSqlSession().update( "qnaBoard.updateArticle", qnaDto );
	}
	
	// �� ��ȸ �� ó�������� �����ϴ� changeCurrentStatus
	@Override
	public void changeCurrentStatus(int num) {
		SqlMapClient.getSqlSession().update( "qnaBoard.changeCurrentStatus", num );
	}
	
	// �ۿ� �亯�� �ٴ� updateAnswerArticle
	@Override
	public int updateAnswerArticle( Map<String, Object> map ) {
		return SqlMapClient.getSqlSession().update( "qnaBoard.updateAnswerArticle", map );
	}
	
	// ���� �����ϴ� deleteArticle
	@Override
	public int deleteArticle(int num) {
		return SqlMapClient.getSqlSession().delete( "qnaBoard.deleteArticle", num );
	}
}