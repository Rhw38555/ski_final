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
public class AdminEventModifyFormHandler implements CommandHandler{

	@Resource
	private EventBoardDao eventDao;
	
	@RequestMapping( "/adminEventModifyForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println( "num : " + request.getParameter("num")); // num 체크
		
		int num = Integer.parseInt( request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		EventBoardDataBean eventDto = eventDao.getArticle( num );
		
		request.setAttribute( "num", num );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "eventDto", eventDto );
		
		return new ModelAndView( "eventBoard/adminEventModifyForm" );
	}

}