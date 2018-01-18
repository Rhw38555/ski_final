package handler.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;



@Controller
public class ChatHandler2 implements CommandHandler{
	
	
	@RequestMapping( "/chat2" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.getSession().setAttribute("memId", "bbb");
		
		return new ModelAndView( "main/chat2" );
	}

}