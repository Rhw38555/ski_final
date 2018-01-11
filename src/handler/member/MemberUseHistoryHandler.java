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
public class MemberUseHistoryHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping( "/memberUseHistory" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return new ModelAndView( "member/memberUseHistory" );
	}

}
