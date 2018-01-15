package handler.qnaBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eventBoard.EventBoardDataBean;
import handler.CommandHandler;
import qnaBoard.QnaBoardDao;
import qnaBoard.QnaBoardDataBean;

@Controller
public class AdminQnaListHandler implements CommandHandler{
	
	@Resource
	QnaBoardDao qnaDao;
	
	@RequestMapping( "/adminQnaList" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int count = 0;				// 전체글수
		
		int pageBlock = 10;			// 페이지 블록 수
		int pageSize = 8;			// 한 페이지에 출력할 글의 수
		String pageNum = null;		// 현재페이지
		int currentPage = 0;		// 현재페이지
		int start = 0;				// 현재페이지 시작 글번호
		int end = 0;				// 현재페이지 끝 글번호
		int number = 0;				// 출력할 글번호
		
		int startPage = 0;			// 페이지의 시작
		int endPage = 0;			// 페이지의 끝
		int pageCount = 0;			// 페이지의 개수
		String current_status = null;	// 현재 진행상태
		
		current_status = request.getParameter( "current_status" );
		System.out.println("current_status : " + current_status ); // 진행상태 체크
		
		if( current_status == null || current_status.equals( "0" ) ) {
			System.out.println( "전체글 개수 체크" );
			current_status = "0";
			count = qnaDao.getCountAdmin();
		} else if( current_status != null || current_status.equals( "0" ) ) {
			System.out.println( current_status + " 상태 개수 체크" );
			count = qnaDao.getCountStatus( current_status );
		}
		
		System.out.println("current_status : " + current_status ); // 다시 체크
		System.out.println("AdminEventBoard 카운트 : " + count);	// 카운트 체크용 콘솔
		
		request.setAttribute( "count", count );
		
		if( count > 0 ) {
			pageNum = request.getParameter( "pageNum" );
			if( pageNum == null ) {
				pageNum = "1";
			}
			
			currentPage = Integer.parseInt( pageNum );
			
			pageCount = ( count / pageSize )
					+ ( count % pageSize > 0 ? 1 : 0 ); 
			
			if( currentPage > pageCount ) currentPage = pageCount;
			
			start = ( currentPage - 1 ) * pageSize + 1;
					// ( 3 - 1 ) * 10 + 1		21
			end = start + pageSize - 1;
					// 21 + 10 - 1				30
			
			number = count - ( currentPage - 1 ) * pageSize;
					// 50 - ( 2 - 1 ) * 10		40
					
			startPage = ( currentPage / pageBlock ) * pageBlock + 1;
					// ( 5 / 10 ) * 10 + 1 		1
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock;
					
			endPage = startPage + pageBlock - 1;
					// 1 + 10 - 1				10
					
			if( endPage > pageCount ) endPage = pageCount;		
		
			request.setAttribute( "pageNum", pageNum );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "number", number );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			
			Map<String, Object> map
				= new HashMap<String, Object>();
			
			List<QnaBoardDataBean> articles = null;
			
			
			
			if( current_status.equals( "0" ) ) {
				System.out.println( "전체 목록을 불러옵니다" );
				map.put( "start", start );
				map.put( "end", end );
				articles = qnaDao.getArticlesAdmin( map );
			} else {
				System.out.println( current_status +" 목록을 불러옵니다" );
				map.put( "current_status", current_status );
				map.put( "start", start );
				map.put( "end", end );
				articles = qnaDao.getArticlesStatus( map );
			}
			
			
			
			request.setAttribute( "articles", articles );
		}
		
		return new ModelAndView( "qnaBoard/adminQnaList" );
	}

}
