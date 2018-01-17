package handler.noticeBoard;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import noticeBoard.NoticeBoardDao;
import noticeBoard.NoticeBoardDataBean;
import handler.CommandHandler;

@Controller
public class AdminNoticeWriteProHandler implements CommandHandler{

	@Resource
	private NoticeBoardDao noticeBoardDao;	
	
	@RequestMapping( "/adminNoticeWritePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding( "utf-8" );
			
		NoticeBoardDataBean noticeBoardDto = new NoticeBoardDataBean();
		noticeBoardDto.setSubject( request.getParameter( "subject" ) );
		noticeBoardDto.setContent( request.getParameter( "content" ) );

		int result = noticeBoardDao.insertArticle( noticeBoardDto );	
	
		request.setAttribute( "result", result );
		
		return new ModelAndView( "noticeBoard/adminNoticeWritePro" );
	}

}