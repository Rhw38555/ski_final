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

@Controller
public class ReverseChangeRoomFormHandler implements CommandHandler{

	@Resource
	private ReverseDao reverseDao;
	
	@RequestMapping( "/reverseChangeRoomForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		List<RoomReverseDataBean> re = reverseDao.room_getReserve(num);
		
		request.setAttribute("re", re);
		
		return new ModelAndView( "reverse/reverseChangeRoomForm" );
	}

}
