package handler.ffBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ffBoard.FFBoardDao;
import handler.CommandHandler;

@Controller
public class AdminFFDeleteProHandler implements CommandHandler{
	
	@Resource
	FFBoardDao ffDao;
	
	@RequestMapping( "/adminFFDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		
		int result = ffDao.deleteArticle( num );
		
		request.setAttribute( "result", result );
		request.setAttribute( "pageNum", request.getParameter( "pageNum" ) );
		request.setAttribute( "division", request.getParameter( "division" ) );
		
		return new ModelAndView( "ffBoard/adminFFDeletePro" );
	}

}