package handler.qnaBoard;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import qnaBoard.QnaBoardDao;

@Controller
public class AdminQnaModifyProHandler implements CommandHandler{
	
	@Resource
	QnaBoardDao qnaDao;
	
	@RequestMapping( "/adminQnaModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "UTF-8" );
		
		int num = Integer.parseInt( ( request.getParameter( "num" ) ) );
		String answer = request.getParameter( "answer" );
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put( "answer", answer );
		map.put( "num", num );
		
		int result = qnaDao.updateAnswerArticle( map );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "qnaBoard/adminQnaModifyPro" );
	}

}