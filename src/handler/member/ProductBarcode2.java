package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import barcode.BarcodeDao;
import barcode.ProductBarcodeDataBean;
import handler.CommandHandler;

@Controller
public class ProductBarcode2 implements CommandHandler{

	@Resource
	private BarcodeDao barcodeDao;	
	
	@RequestMapping( "/productBarcode2" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView( "member/productBarcode2" );
	}

}

