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
public class AdminNoticeModifyFormHandler implements CommandHandler{
	
	@Resource
	private NoticeBoardDao noticeboardDao;
	
	@RequestMapping( "/adminNoticeModifyForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt( request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute( "num", num );
		request.setAttribute( "pageNum", pageNum );

		NoticeBoardDataBean noticeboardDto = noticeboardDao.getArticle(num);
		request.setAttribute( "noticeboardDto", noticeboardDto );

		
		return new ModelAndView( "noticeBoard/adminNoticeModifyForm" );
	}

}