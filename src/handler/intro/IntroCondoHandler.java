package handler.intro;

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
public class IntroCondoHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/introCondo" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id=null;
		int num=-1;
		if( (String)request.getSession().getAttribute("memId") != null ) {
			id = (String)request.getSession().getAttribute("memId");
			num = logonDao.getMember(id).getNum();
		}

		request.setAttribute( "num", num );
		return new ModelAndView( "intro/introCondo" );
	}

}
