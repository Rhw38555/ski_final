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
public class MemberJoinProHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/memberJoinPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding( "utf-8" );
		
		LogonDataBean logonDto = new LogonDataBean();
		logonDto.setId( request.getParameter( "id" ) );
		logonDto.setPasswd( request.getParameter( "passwd" ) );
		logonDto.setName( request.getParameter( "name" ) );
	
		// tel
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) 
			&& ! tel2.equals( "" ) 
			&& ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3; 
		}
		logonDto.setTel( tel );	
	
		// email
		String email = null;
		String email0 = request.getParameter("email0");
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		if( email2.equals("")) {
			email = email0;
		} else {
			email = email1 + email2;	
		}
		logonDto.setEmail( email );

		int result = logonDao.insertMember( logonDto );
	
		request.setAttribute( "result", result );			
		
		return new ModelAndView( "member/memberJoinPro" );
	}

}
