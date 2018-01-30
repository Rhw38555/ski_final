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
public class MemoModifyHandler implements CommandHandler{
	
	@Resource
	MemoDao memoDao;
	
	@RequestMapping( "/memoModify" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String day_check = request.getParameter( "day_check" );
		
		MemoDataBean memoDto = new MemoDataBean();
		
		memoDto = memoDao.getMemoOne( day_check );
		
		request.setAttribute( "memoDto", memoDto );
		request.setAttribute( "day_check", day_check );
		
		return new ModelAndView( "main/memoModify" );
	}
}
