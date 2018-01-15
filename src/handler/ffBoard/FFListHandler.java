package handler.ffBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ffBoard.FFBoardDao;
import ffBoard.FFBoardDataBean;
import handler.CommandHandler;

@Controller
public class FFListHandler implements CommandHandler{

	@Resource
	FFBoardDao ffDao;
	
	@RequestMapping( "/ffList" )
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
		String division = null;
		
		division = request.getParameter( "division" );		// 시설 구분 0 전체 1 식음 2 부대
		
		System.out.println("구분 : " + division);
		
		if( division == null || division.equals("0") ) {
			division = "0";
			count = ffDao.getCount();
		} else if ( ! division.equals( "0" ) && division != null ) {
			String div = division;
			if( div.equals("1") ) {
				div = "식음시설";
			} else if( div.equals("2") ) {
				div = "부대시설";
			}
			count = ffDao.getCount( div );
			System.out.println( div );
		}
		
		System.out.println("재구분 : " + division);
		System.out.println("AdminEventBoard 카운트 : " + count);	// 카운트 체크용 콘솔
		
		request.setAttribute( "division", division );
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
			
			map.put( "start", start );
			map.put( "end", end );
			
			List<FFBoardDataBean> articles;
			
			if( division == "0" ) {
				articles = ffDao.getArticles( map );
			} else {
				if( division.equals( "1" ) ) {
					division = "식음시설";
				} else if( division.equals( "2" ) ) {
					division = "부대시설";
				}
				System.out.println(division);
				map.put( "division", division );
				articles = ffDao.getDivisionArticles( map );
			}
			request.setAttribute( "articles", articles );
		}
		
		return new ModelAndView( "ffBoard/ffList" );
	}

}
