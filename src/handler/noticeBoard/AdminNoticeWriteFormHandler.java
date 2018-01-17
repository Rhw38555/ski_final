package handler.noticeBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminNoticeWriteFormHandler implements CommandHandler{

	@RequestMapping( "/adminNoticeWriteForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 제목글
		int num = 0;	
		
		if( request.getParameter( "num" ) != null ) {
			// 답변글
			num = Integer.parseInt( request.getParameter( "num" ) );
		}	

		request.setAttribute( "num", num );
		
		return new ModelAndView( "noticeBoard/adminNoticeWriteForm" );
	}

}