package handler.eventBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eventBoard.EventBoardDao;
import eventBoard.EventBoardDataBean;
import handler.CommandHandler;

@Controller
public class AdminEventContentHandler implements CommandHandler{
	
	@Resource
	private EventBoardDao eventDao;

	@RequestMapping( "/adminEventContent" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
	
		EventBoardDataBean eventDto = eventDao.getArticle( num );
	
		request.setAttribute( "eventDto", eventDto );
		request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView( "eventBoard/adminEventContent" );
	}

}
