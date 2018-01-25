package handler.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import reverse.ReverseDao;
import reverse.RoomReverseDataBean;
import reverse.SkiReverseDataBean;

@Controller
public class AdminCalandarHandler implements CommandHandler {
	
	@Resource
	ReverseDao reserveDao;
	
	@RequestMapping( "/adminCalandar" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// Calander 만들기
		Calendar cal = Calendar.getInstance();
		
		String strYear = request.getParameter( "year" );
		String strMonth = request.getParameter( "month" );
		
		System.out.println( "연 받기 : " + strYear );
		System.out.println( "월 받기 : " + strMonth );
		
		int year = cal.get( Calendar.YEAR );
		int month = cal.get( Calendar.MONTH );
		int date = cal.get( Calendar.DATE );
		
		if( strYear != null ) {
			year = Integer.parseInt( strYear );
			month = Integer.parseInt( strMonth );
		} else {
			
		}
		System.out.println( "month : " + month );
		// 년도, 월 세팅
		cal.set( year, month, 1 );
		
		int startDay = cal.getMinimum( Calendar.DATE );
		int endDay = cal.getActualMaximum( Calendar.DAY_OF_MONTH );
		int start = cal.getActualMinimum( Calendar.DAY_OF_WEEK );
		int newLine = 0;
		
		// 오늘 날짜 저장
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMdd" );
		int intToday = Integer.parseInt( sdf.format( todayCal.getTime() ) );
		
		// DB 조회		
		String mp = Integer.toString(month + 1);
		
		if( mp.length() == 1 ) {
			mp = "0" + mp;
		}
		System.out.println( "mp : " + mp );
		String tStartDay = Integer.toString(startDay);
		if( tStartDay.length() == 1 ) {
			tStartDay = "0" + tStartDay;
		}
		
		System.out.println( "tStartDay : " + tStartDay );
		
		String startDate = mp + tStartDay + Integer.toString( year );
		String endDate = mp + endDay + Integer.toString( year );
		
		System.out.println( "맵전startDate : " + startDate );
		System.out.println( "맵전endDate : " + endDate );
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put( "startDate", startDate );
		map.put( "endDate", endDate );
		
		System.out.println( "맵후startDate : " + map.get( "startDate" ) );
		System.out.println( "맵후endDate : " + map.get( "endDate" ) );
		
		List<RoomReverseDataBean> roomDto = new ArrayList<RoomReverseDataBean>(); 
		roomDto = reserveDao.roomCount( map );
		
		System.out.println( roomDto.size() );
		
		List<SkiReverseDataBean> skiDto = new ArrayList<SkiReverseDataBean>();
		skiDto = reserveDao.skiCount( map );
		
		System.out.println( skiDto.size() );
		
		// chart 용 room / ski 정보 저장
		int chartroom2 = 0;
		int chartroom4 = 0;
		int chartroom8 = 0;
		
		int chartski_morning = 0;
		int chartski_night = 0;
		int chartski_day = 0;
		
		for( int i=0; i<roomDto.size(); i++ ) {
			chartroom2 += roomDto.get(i).getRoom_2();
			chartroom4 += roomDto.get(i).getRoom_4();
			chartroom8 += roomDto.get(i).getRoom_8();
		}
		request.setAttribute( "chartroom2", chartroom2 );
		request.setAttribute( "chartroom4", chartroom4 );
		request.setAttribute( "chartroom8", chartroom8 );
		
		for( int i=0; i<skiDto.size(); i++ ) {
			chartski_morning += skiDto.get(i).getSki_morning();
			chartski_night += skiDto.get(i).getSki_night();
			chartski_day += skiDto.get(i).getSki_day();
		}
		request.setAttribute( "chartski_morning", chartski_morning );
		request.setAttribute( "chartski_night", chartski_night );
		request.setAttribute( "chartski_day", chartski_day );
		
		request.setAttribute( "strYear", strYear );
		request.setAttribute( "strMonth", strMonth );
		request.setAttribute( "year", year );
		request.setAttribute( "month", month );
		request.setAttribute( "date", date );
		request.setAttribute( "startDay", startDay );
		request.setAttribute( "endDay", endDay );
		request.setAttribute( "start", start );
		request.setAttribute( "newLine", newLine );
		request.setAttribute( "intToday", intToday );
		request.setAttribute( "monthplus", (month+1) );
		request.setAttribute( "monthminus", (month-1) );
		request.setAttribute( "yearplus", (year+1) );
		request.setAttribute( "yearminus", (year-1) );
		
		request.setAttribute( "roomDto", roomDto );
		request.setAttribute( "skiDto", skiDto );
		
		System.out.println( "startDay 체크 : " + startDay );
		
		return new ModelAndView( "main/adminCalandar" );
	}
}
