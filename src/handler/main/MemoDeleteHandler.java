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
public class MemoDeleteHandler implements CommandHandler {
	
	@Resource
	MemoDao memoDao;
	
	@RequestMapping( "/memoDelete" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String startDate = request.getParameter( "startDate" );
		String endDate = request.getParameter( "endDate" );
		String day_check = request.getParameter( "day_check" );
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put( "startDate", startDate );
		map.put( "endDate", endDate );
		map.put( "day_check", day_check );
		
		int result = memoDao.deleteMemo( map );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "main/memoPro" );
	}
}
