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
public class QnaWriteProHandler implements CommandHandler{
	
	@Resource
	QnaBoardDao qnaDao;
	
	@RequestMapping( "/qnaWritePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "UTF-8" );
		
		QnaBoardDataBean qnaDto = new QnaBoardDataBean();
		
		System.out.println( request.getSession().getAttribute( "memId" ) );
		
		qnaDto.setId( (String)request.getSession().getAttribute( "memId" ) );
		qnaDto.setSubject( request.getParameter( "subject" ) );
		qnaDto.setContent( request.getParameter( "content" ) );
		
		int result = qnaDao.insertArticle( qnaDto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "qnaBoard/qnaWritePro" );
	}

}