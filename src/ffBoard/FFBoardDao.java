package ffBoard;

import java.util.List;
import java.util.Map;

public interface FFBoardDao {
	public int getCount();
	
	public int getCount( String division );
	
	public int insertArticle( FFBoardDataBean ffDto );
	
	public List<FFBoardDataBean> getArticles( Map<String, Object> map );
	
	public List<FFBoardDataBean> getDivisionArticles( Map<String, Object> map );
	
	public FFBoardDataBean getArticle( int num );
	
	public int deleteArticle( int num );
	
	public int updateArticle( FFBoardDataBean ffDto );
}
