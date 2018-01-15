package handler.ffBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ffBoard.FFBoardDao;
import ffBoard.FFBoardDataBean;
import handler.CommandHandler;

@Controller
public class FFContentHandler implements CommandHandler{
	
	@Resource
	FFBoardDao ffDao;
	
	@RequestMapping( "/ffContent" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		String division = request.getParameter( "division" );
		
		FFBoardDataBean ffDto = ffDao.getArticle( num );
		
		String imglocation = ffDto.getImages();
		String[] img = imglocation.split("/");
		
		System.out.println(imglocation);
		
		for( int i = 0; i < img.length; i++ ) {
			System.out.println(img[i]);
		}
		
		request.setAttribute( "img", img );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "division", division );
		request.setAttribute( "ffDto", ffDto );
		
		return new ModelAndView( "ffBoard/ffContent" );
	}

}
