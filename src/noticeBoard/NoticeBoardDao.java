package noticeBoard;

import java.util.List;
import java.util.Map;

import noticeBoard.NoticeBoardDataBean;

public interface NoticeBoardDao {
	public int getCount();																// 리스트
	public int insertArticle( NoticeBoardDataBean noticeboardDto );						// 글쓰기
	public List<NoticeBoardDataBean> getArticles( Map<String, Integer> map );			// 리스트
	public NoticeBoardDataBean getArticle( int num );									// 글보기
	public int deleteArticle( int num );												// 삭제
	public int updateArticle( NoticeBoardDataBean noticeboardDto );						// 수정

}
