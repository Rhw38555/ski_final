package handler.noticeBoard;

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
public class AdminNoticeModifyProHandler implements CommandHandler{

	@Resource
	private NoticeBoardDao noticeboardDao;	
	
	@RequestMapping( "/adminNoticeModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
	
		NoticeBoardDataBean noticeboardDto = new NoticeBoardDataBean();
		noticeboardDto.setSubject( request.getParameter( "subject" ) );
		noticeboardDto.setContent( request.getParameter( "content" ) );
		noticeboardDto.setNum( Integer.parseInt( request.getParameter( "num" ) ) );
			
		String pageNum = request.getParameter("pageNum");

	  	int result = noticeboardDao.updateArticle(noticeboardDto);
	
	  	request.setAttribute( "result", result );
	  	request.setAttribute( "pageNum", pageNum );
	  	
		return new ModelAndView( "noticeBoard/adminNoticeModifyPro" );
	}

}