package handler.eventBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminEventDeleteProHandler implements CommandHandler{

	@RequestMapping( "/adminEventDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return new ModelAndView( "eventBoard/adminEventDeletePro" );
	}

}