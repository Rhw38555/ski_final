package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import barcode.BarcodeDao;
import handler.CommandHandler;
import reverse.ReverseDao;


@Controller
public class MemberReservationConfirmPro implements CommandHandler{
	
	@Resource
	private ReverseDao reverseDao;
	@Resource
	private BarcodeDao barcodeDao;
	
	@RequestMapping( "/memberReservationConfirmPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String num = request.getParameter("num");
		String check = request.getParameter("check");
		String id = (String)request.getSession().getAttribute("memId");
		int result;
		if(check.equals("0")) {
			//룸삭제
			result = reverseDao.room_delete(Integer.parseInt(num));
			if(reverseDao.roomCheck(id)==0 && reverseDao.skiCheck(id)==0) {
				//정보 다없으면 바코드 삭제
				barcodeDao.deleteUserbarcode(id);
			}
		}else {
			//스키삭제
			result = reverseDao.ski_delete(Integer.parseInt(num));
			if(reverseDao.roomCheck(id)==0 && reverseDao.skiCheck(id)==0) {
				barcodeDao.deleteUserbarcode(id);
			}
		}
		request.setAttribute("result", result);
		return new ModelAndView( "member/memberReservationConfirmPro" );
	}

}