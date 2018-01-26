package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import barcode.BarcodeDao;
import barcode.UserBarcodeDataBean;
import handler.CommandHandler;


@Controller
public class MemberUseHistoryPro implements CommandHandler{
	
	@Resource
	private BarcodeDao barcodeDao;
	
	@RequestMapping( "/memberUseHistoryPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String)request.getSession().getAttribute("memId");
		int price = Integer.parseInt(request.getParameter("price"));
		UserBarcodeDataBean userbarcodeDto = new UserBarcodeDataBean();
		userbarcodeDto.setId(id);
		userbarcodeDto.setWallet(price);
		int result = barcodeDao.chargeUserbarcode(userbarcodeDto);
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView( "member/memberUseHistoryPro" );
	}

}