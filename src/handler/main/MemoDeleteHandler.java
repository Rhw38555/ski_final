package handler.main;

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
		String day_check = request.getParameter( "day_check" );
		
		int result = memoDao.deleteMemo( day_check );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "main/memoPro" );
	}
}
