package handler.reverse;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import reverse.ReverseDao;
import reverse.SkiReverseDataBean;

@Controller
public class ReverseSkiProHandler implements CommandHandler{
	
	@Resource
	private ReverseDao reserveDao;
	
	@RequestMapping( "/reverseSkiPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String[] date = (request.getParameter("ski_date")).split(",");
		String[] cnt = (request.getParameter("ski_count")).split(",");
		
		SimpleDateFormat tran = new SimpleDateFormat("yyyy-MM-dd");
		
		String id = (String) request.getSession().getAttribute("memId");
		
		Date date1 = tran.parse(date[0]);
		int cnt2_1 = Integer.parseInt(cnt[0]);
		int cnt4_1 = Integer.parseInt(cnt[1]);
		int cnt8_1 = Integer.parseInt(cnt[2]);
		
		SkiReverseDataBean skiDto_1 = new SkiReverseDataBean();
		SkiReverseDataBean skiDto_2 = new SkiReverseDataBean();
		SkiReverseDataBean skiDto_3 = new SkiReverseDataBean();
		
		int num = reserveDao.ski_getNum();
		int result = 0;
		
		skiDto_1.setNum(num);
		skiDto_1.setSki_date(date1);
		skiDto_1.setReg_date(new Timestamp(System.currentTimeMillis()));
		skiDto_1.setSki_morning(cnt2_1);
		skiDto_1.setSki_night(cnt4_1);
		skiDto_1.setSki_day(cnt8_1);
		skiDto_1.setId("id1");
		skiDto_1.setName(request.getParameter("name"));
		skiDto_1.setTel(request.getParameter("tel"));
		skiDto_1.setCarnum(request.getParameter("carnum"));
		skiDto_1.setSki_price(Integer.parseInt(request.getParameter("ski_price")));
		result = reserveDao.ski_insert(skiDto_1);
		
		
		if(date.length > 1) {
			Date date2 = tran.parse(date[1]);
			int cnt2_2 = Integer.parseInt(cnt[3]);
			int cnt4_2 = Integer.parseInt(cnt[4]);
			int cnt8_2 = Integer.parseInt(cnt[5]);
			skiDto_2.setNum(num);
			skiDto_2.setSki_date(date2);
			skiDto_2.setReg_date(new Timestamp(System.currentTimeMillis()));
			skiDto_2.setSki_morning(cnt2_2);
			skiDto_2.setSki_night(cnt4_2);
			skiDto_2.setSki_day(cnt8_2);
			skiDto_2.setId("id1");
			skiDto_2.setName(request.getParameter("name"));
			skiDto_2.setTel(request.getParameter("tel"));
			skiDto_2.setCarnum(request.getParameter("carnum"));
			skiDto_2.setSki_price(Integer.parseInt(request.getParameter("ski_price")));
			result = reserveDao.ski_insert(skiDto_2);
			
			if(date.length > 2) {
				Date date3 = tran.parse(date[2]);
				int cnt2_3 = Integer.parseInt(cnt[6]);
				int cnt4_3 = Integer.parseInt(cnt[7]);
				int cnt8_3 = Integer.parseInt(cnt[8]);
				skiDto_3.setNum(num);				
				skiDto_3.setSki_date(date3);
				skiDto_3.setReg_date(new Timestamp(System.currentTimeMillis()));
				skiDto_3.setSki_morning(cnt2_3);
				skiDto_3.setSki_night(cnt4_3);
				skiDto_3.setSki_day(cnt8_3);
				skiDto_3.setId("id1");
				skiDto_3.setName(request.getParameter("name"));
				skiDto_3.setTel(request.getParameter("tel"));
				skiDto_3.setCarnum(request.getParameter("carnum"));
				skiDto_3.setSki_price(Integer.parseInt(request.getParameter("ski_price")));
				result = reserveDao.ski_insert(skiDto_3);
			}
		}		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		
		return new ModelAndView( "reverse/reverseSkiPro" );
	}
}



