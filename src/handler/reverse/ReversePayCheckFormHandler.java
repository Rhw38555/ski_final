package handler.reverse;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import reverse.ReverseDao;
import reverse.RoomReverseDataBean;
import reverse.SkiReverseDataBean;

@Controller
public class ReversePayCheckFormHandler implements CommandHandler{
	
	@Resource
	private ReverseDao reserveDao; 

	@RequestMapping( "/reversePayCheckForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		String check = request.getParameter("check");
		//System.out.println("check: "+check);		
		
		if(check.equals("ski")) {
			List<SkiReverseDataBean> re = reserveDao.ski_getReserve(num);
			request.setAttribute("re", re);
			System.out.println("들어왔다");
		}else if(check.equals("room")) {			
			List<RoomReverseDataBean> re = reserveDao.room_getReserve(num);
			request.setAttribute("re", re);
		}				
		request.setAttribute("check", check);
				
		return new ModelAndView( "reverse/reversePayCheckForm" );
	}

}
