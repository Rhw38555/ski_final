package handler.qnaBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import qnaBoard.QnaBoardDao;
import qnaBoard.QnaBoardDataBean;

@Controller
public class AdminQnaContentHandler implements CommandHandler{
	
	@Resource
	QnaBoardDao qnaDao;
	
	@RequestMapping( "/adminQnaContent" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		String current_status = request.getParameter( "current_status" );
		
		if( current_status.equals( "접수대기" ) ) {
			qnaDao.changeCurrentStatus( num );
		}
		
		QnaBoardDataBean qnaDto = qnaDao.getArticle( num );
				
		request.setAttribute( "qnaDto", qnaDto );
		request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView( "qnaBoard/adminQnaContent" );
	}

}
