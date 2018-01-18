package handler.noticeBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import noticeBoard.NoticeBoardDao;
import noticeBoard.NoticeBoardDataBean;

@Controller
public class NoticeContentHandler implements CommandHandler{

	@Resource
	private NoticeBoardDao noticeboardDao;		
	
	@RequestMapping( "/noticeContent" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter( "pageNum" );
	
		NoticeBoardDataBean noticeboardDto = noticeboardDao.getArticle(num);
		
		request.setAttribute( "noticeboardDto", noticeboardDto );
		request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView( "noticeBoard/noticeContent" );
	}

}
