package handler.main;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import memo.MemoDao;

@Controller
public class MemoWriteHandler implements CommandHandler {
	
	@Resource
	MemoDao memoDao;
	
	@RequestMapping( "/memoWrite" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String memo = request.getParameter( "memoP" );
		String day_check = request.getParameter( "day_check" );
		String check = request.getParameter( "check" );
		
		String startDate;
		String endDate;
		
		System.out.println( memo + " / " + day_check );
		System.out.println( "구분 : " + check );
		
		Map<String, String> map = new HashMap<String, String>();
		int result = 0;
	
		if( check.equals( "1" ) ) { // 작성
			map.put( "memo", memo );
			map.put( "day_check", day_check );
			
			result = memoDao.insertMemo( map );
		} else if( check.equals( "2" ) ) { // 수정
			startDate = request.getParameter( "startDate" );
			endDate = request.getParameter( "endDate" );
			map.put( "memo", memo );
			map.put( "startDate", startDate );
			map.put( "endDate", endDate );
			map.put( "day_check", day_check );
			
			result = memoDao.updateMemo( map );
		}
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "main/memoPro" );
	}
}
