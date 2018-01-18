package noticeBoard;

import java.util.List;
import java.util.Map;

import noticeBoard.NoticeBoardDataBean;
import db.SqlMapClient;

public class NoticeBoardDBBean implements NoticeBoardDao{

	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne("NoticeBoard.getCount");
	}	

	public int insertArticle( NoticeBoardDataBean noticeboardDto ) {
		return SqlMapClient.getSqlSession().insert("NoticeBoard.insertArticle", noticeboardDto);
	}

	public List<NoticeBoardDataBean> getArticles( Map<String, Integer> map ) {
		return SqlMapClient.getSqlSession().selectList("NoticeBoard.getArticles", map );		
	}

	public NoticeBoardDataBean getArticle( int num ) {
		return SqlMapClient.getSqlSession().selectOne("NoticeBoard.getArticle", num);
	}

	public int updateArticle( NoticeBoardDataBean noticeboardDto ) {
		return SqlMapClient.getSqlSession().update("NoticeBoard.updateArticle", noticeboardDto);
	}

	public int deleteArticle( int num ) {
		return SqlMapClient.getSqlSession().delete("NoticeBoard.deleteArticle", num);	
	}
}
