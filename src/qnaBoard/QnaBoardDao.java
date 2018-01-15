package qnaBoard;

import java.util.List;
import java.util.Map;

public interface QnaBoardDao {
	public int getCountAdmin();
	
	public int getCountStatus( String current_status );
	
	public int getCount( String id );

	public int insertArticle( QnaBoardDataBean qnaDto );
	
	public List<QnaBoardDataBean> getArticles( Map<String, Object> map );
	
	public List<QnaBoardDataBean> getArticlesAdmin( Map<String, Object> map );
	
	public List<QnaBoardDataBean> getArticlesStatus( Map<String, Object> map );
	
	public QnaBoardDataBean getArticle( int num );
	
	public int deleteArticle( int num );
	
	public int updateUserArticle( QnaBoardDataBean qnaDto );
	
	public void changeCurrentStatus( int num );
	
	public int updateAnswerArticle( Map<String, Object> map );
}
