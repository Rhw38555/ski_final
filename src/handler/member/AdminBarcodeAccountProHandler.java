package handler.member;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import barcode.BarcodeDao;
import barcode.UseHistoryDataBean;
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
		request.setCharacterEncoding("utf-8");
		
		String calPrice = request.getParameter("calPrice");
		String receipt_barcode = null;
		if(barcodeDao.getReceipt_barcode() != null && barcodeDao.getReceipt_barcode()!="") {
			receipt_barcode ="receipt"+(Integer.parseInt(barcodeDao.getReceipt_barcode().substring(7))+1);
		}else {
			receipt_barcode = "receipt1";
		}
		String user_barcode = request.getParameter("userBarcode");
		int checknum = Integer.parseInt(request.getParameter("checknum"));
		ArrayList<UseHistoryDataBean> product_barcodeInfo = new ArrayList<UseHistoryDataBean>();
		
		
		for(int i=1; i< (checknum*10)+1;i++ ) {
			UseHistoryDataBean useHistoryDto = new UseHistoryDataBean();
			if(receipt_barcode!=null && receipt_barcode!="") 
				useHistoryDto.setReceipt_barcode(receipt_barcode);
			if(user_barcode!=null && user_barcode!="")
				useHistoryDto.setUser_barcode(user_barcode);
			if(request.getParameter("product"+i)!=null && request.getParameter("product"+i)!="")
				useHistoryDto.setProduct_barcode(request.getParameter("product"+i));
			if(request.getParameter("productName"+i)!=null && request.getParameter("productName"+i)!="")
				useHistoryDto.setProduct_name(request.getParameter("productName"+i));
			if(request.getParameter("price"+i)!=null && request.getParameter("price"+i)!="")
				useHistoryDto.setProduct_price(request.getParameter("price"+i));
			if(request.getParameter("productCounts"+i)!=null && request.getParameter("productCounts"+i)!="")
				useHistoryDto.setProduct_count(Integer.parseInt( request.getParameter("productCounts"+i) )  );
			if(request.getParameter("productMaket"+i)!=null && request.getParameter("productMaket"+i)!="") 
				useHistoryDto.setMaket(request.getParameter("productMaket"+i));
			
			if(useHistoryDto.getProduct_barcode() !=null ) {
				product_barcodeInfo.add(useHistoryDto);
			}
			
		}
		
		
		int result= barcodeDao.modifyUserBarcode(calPrice,product_barcodeInfo);
		
		request.setAttribute( "result", result );
		return new ModelAndView( "member/adminBarcodeAccountPro" );
	}

}
