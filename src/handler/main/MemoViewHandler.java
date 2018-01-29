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
import memo.MemoDataBean;

@Controller
public class MemoViewHandler implements CommandHandler {
	
	@Resource
	MemoDao memoDao;
	
	@RequestMapping( "/memoView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		MemoDataBean memoDto = new MemoDataBean();
		String startDate = request.getParameter( "startDate" );
		String endDate = request.getParameter( "endDate" );
		String day_check = request.getParameter( "day_check" );
		
		System.out.println( "startDate " + startDate );
		System.out.println( "endDate " + endDate );
		System.out.println( "day_check " + day_check );
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put( "startDate", startDate );
		map.put( "endDate", endDate );
		map.put( "day_check", day_check );
		
		memoDto = memoDao.getMemoOne( map );
		
		request.setAttribute( "startDate", startDate );
		request.setAttribute( "endDate", endDate );
		request.setAttribute( "day_check", day_check );
		request.setAttribute( "memoDto", memoDto );
		
		return new ModelAndView( "main/memoView" );
	}
}
