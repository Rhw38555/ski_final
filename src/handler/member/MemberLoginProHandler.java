package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;

@Controller
public class MemberLoginProHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/memberLoginPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );

		int result = logonDao.check( id, passwd );
	
		request.setAttribute( "result", result );
		request.setAttribute( "id", id );		
		
		return new ModelAndView( "member/memberLoginPro" );
	}

}
