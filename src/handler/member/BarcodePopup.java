package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class BarcodePopup implements CommandHandler{

	@RequestMapping( "/barcodePopup" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println(request.getParameter("user_barcode"));
		request.setAttribute("user_barcode", request.getParameter("user_barcode"));
		return new ModelAndView("member/barcodePopup");
	}

}