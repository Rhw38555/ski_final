package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import barcode.BarcodeDao;
import handler.CommandHandler;

/*
 * 
 * 
 */
@Controller
public class AdminBarcodeAccountProHandler implements CommandHandler{
	@Resource
	private BarcodeDao barcodeDao;
	
	
	@RequestMapping( "/adminBarcodeAccountPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//String productsPrice = request.getParameter("productsPrice");
		//String userPrice = request.getParameter("userPrice");
		String calPrice = request.getParameter("calPrice");
		int result= barcodeDao.modifyUserBarcode(calPrice);
		request.setAttribute( "result", result );
		return new ModelAndView( "member/adminBarcodeAccountPro" );
	}

}
