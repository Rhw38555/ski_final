package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminMemberLogout implements CommandHandler{

	@RequestMapping( "/adminMemberLogout" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		if( request.getSession().getAttribute( "adminId" ) != null ) {
			request.getSession().removeAttribute( "adminId" );
		} else if( request.getSession().getAttribute( "barcodeadminId" ) != null ) {
			request.getSession().removeAttribute( "barcodeadminId" );
		}
		
		return new ModelAndView( "main/main" );
	}

}
