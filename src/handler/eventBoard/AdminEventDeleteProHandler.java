package handler.eventBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eventBoard.EventBoardDao;
import handler.CommandHandler;

@Controller
public class AdminEventDeleteProHandler implements CommandHandler{
	
	@Resource
	private EventBoardDao eventDao;
	
	@RequestMapping( "/adminEventDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		
		int result = eventDao.deleteArticle( num );
		
		request.setAttribute( "result", result );
		request.setAttribute( "pageNum", request.getParameter( "pageNum" ) );
		
		return new ModelAndView( "eventBoard/adminEventDeletePro" );
	}

}