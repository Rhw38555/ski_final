package handler.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminCalendarFormHandler implements CommandHandler{

	@RequestMapping( "/adminCalendarFormHandler" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Calendar cal = Calendar.getInstance();
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

		 
		int year = cal.get(Calendar.YEAR);
		request.setAttribute("year", year);
		
		int month = cal.get(Calendar.MONTH);
		request.setAttribute("month", month);
		
		int date = cal.get(Calendar.DATE);

		 
		if(strYear != null)
		{
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		}else{
			
		}
		//년도/월 셋팅
		cal.set(year, month, 1);

		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		request.setAttribute("startDay", startDay);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		request.setAttribute("endDay", endDay);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		request.setAttribute("start", start);
		int newLine = 0;
		request.setAttribute("newLine", newLine);
		//오늘 날짜 저장.
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
		request.setAttribute("intToday", intToday);
		return new ModelAndView( "member/adminCalendarFormHandler" );
	}

}