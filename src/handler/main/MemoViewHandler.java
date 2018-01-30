package handler.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import memo.MemoDao;
import memo.MemoDataBean;

@Controller
public class MemoViewHandler implements CommandHandler {
	
	@Resource
	MemoDao memoDao;
	
	@RequestMapping( "/memoView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		MemoDataBean memoDto = new MemoDataBean();
		String day_check = request.getParameter( "day_check" );
		
		System.out.println( "day_check " + day_check );
		
		memoDto = memoDao.getMemoOne( day_check );

		request.setAttribute( "day_check", day_check );
		request.setAttribute( "memoDto", memoDto );
		
		return new ModelAndView( "main/memoView" );
	}
}
