package handler.noticeBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import noticeBoard.NoticeBoardDao;
import handler.CommandHandler;

@Controller
public class AdminNoticeDeleteProHandler implements CommandHandler{

	@Resource
	private NoticeBoardDao noticeboardDao;	
	
	@RequestMapping( "/adminNoticeDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
	
		String pageNum = request.getParameter( "pageNum" );
	
		request.setAttribute( "pageNum", pageNum );
		
		int result = noticeboardDao.deleteArticle( num );
		request.setAttribute( "result", result );
		return new ModelAndView( "noticeBoard/adminNoticeDeletePro" );
	}

}