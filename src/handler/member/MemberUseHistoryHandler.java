package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import barcode.BarcodeDao;
import handler.CommandHandler;

@Controller
public class MemberUseHistoryHandler implements CommandHandler{
	
	@Resource
	private BarcodeDao barcodeDao;
	
	@RequestMapping( "/memberUseHistory" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		if(request.getSession().getAttribute("memId") !=null && request.getSession().getAttribute("memId")!="") {
			String user_barcode = barcodeDao.getUser_barcode((String)request.getSession().getAttribute("memId"));
			request.setAttribute("user_barcode", user_barcode);
			System.out.println(user_barcode);
		}
		
		return new ModelAndView( "member/memberUseHistory" );
	}

}
