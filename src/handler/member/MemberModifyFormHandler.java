package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;
import member.LogonDataBean;

@Controller
public class MemberModifyFormHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/memberModifyForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = (String) request.getSession().getAttribute( "memId" );

			LogonDataBean logonDto = logonDao.getMember( id );
			request.setAttribute( "logonDto", logonDto );
		
		return new ModelAndView( "member/memberModifyForm" );
	}

}
