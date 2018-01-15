package eventBoard;

import java.util.List;
import java.util.Map;

public interface EventBoardDao {
	public int getCount();
	
	public int insertArticle( EventBoardDataBean eventDto );
	
	public List<EventBoardDataBean> getArticles( Map<String, Integer> map );
	
	public EventBoardDataBean getArticle( int num );
	
	public int deleteArticle( int num );
	
	public int updateArticle( EventBoardDataBean eventDto );
}
