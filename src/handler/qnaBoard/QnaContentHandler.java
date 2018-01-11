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
public class QnaContentHandler implements CommandHandler{
	
	@Resource
	QnaBoardDao qnaDao;
	
	@RequestMapping( "/qnaContent" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		
		QnaBoardDataBean qnaDto = qnaDao.getArticle( num );
		
		request.setAttribute( "qnaDto", qnaDto );
		request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView( "qnaBoard/qnaContent" );
	}

}
