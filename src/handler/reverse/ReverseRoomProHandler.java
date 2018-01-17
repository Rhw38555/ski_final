package handler.reverse;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

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
public class ReverseRoomProHandler implements CommandHandler{
	
	@Resource
	private ReverseDao reserveDao;

	@RequestMapping( "/reverseRoomPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String[] date = (request.getParameter("room_date")).split(",");
		String[] cnt = (request.getParameter("room_cnt")).split(",");
		
		SimpleDateFormat tran = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date1 = tran.parse(date[0]);
		int cnt2_1 = Integer.parseInt(cnt[0]);
		int cnt4_1 = Integer.parseInt(cnt[1]);
		int cnt8_1 = Integer.parseInt(cnt[2]);
		
		RoomReverseDataBean roomDto_1 = new RoomReverseDataBean();
		RoomReverseDataBean roomDto_2 = new RoomReverseDataBean();
		RoomReverseDataBean roomDto_3 = new RoomReverseDataBean();
		
		int num = reserveDao.room_getNum();
		int result = 0;
		
		roomDto_1.setNum(num);
		roomDto_1.setRoom_date(date1);
		roomDto_1.setReg_date(new Timestamp(System.currentTimeMillis()));
		roomDto_1.setRoom_2(cnt2_1);
		roomDto_1.setRoom_4(cnt4_1);
		roomDto_1.setRoom_8(cnt8_1);
		roomDto_1.setId("id1");
		roomDto_1.setName(request.getParameter("name"));
		roomDto_1.setTel(request.getParameter("tel"));
		roomDto_1.setCarnum(request.getParameter("carnum"));
		roomDto_1.setRoom_price(Integer.parseInt(request.getParameter("room_price")));
		roomDto_1.setRoom_check(request.getParameter("room_check"));
		result = reserveDao.room_insert(roomDto_1);	
		
		if(date.length > 1) {
			Date date2 = tran.parse(date[1]);
			int cnt2_2 = Integer.parseInt(cnt[3]);
			int cnt4_2 = Integer.parseInt(cnt[4]);
			int cnt8_2 = Integer.parseInt(cnt[5]);
			roomDto_2.setNum(num);
			roomDto_2.setRoom_date(date2);
			roomDto_2.setReg_date(new Timestamp(System.currentTimeMillis()));
			roomDto_2.setRoom_2(cnt2_2);
			roomDto_2.setRoom_4(cnt4_2);
			roomDto_2.setRoom_8(cnt8_2);
			roomDto_2.setId("id1");
			roomDto_2.setName(request.getParameter("name"));
			roomDto_2.setTel(request.getParameter("tel"));
			roomDto_2.setCarnum(request.getParameter("carnum"));
			roomDto_2.setRoom_price(Integer.parseInt(request.getParameter("room_price")));
			roomDto_2.setRoom_check(request.getParameter("room_check"));
			result = reserveDao.room_insert(roomDto_2);
			
			if(date.length > 2) {
				Date date3 = tran.parse(date[2]);
				int cnt2_3 = Integer.parseInt(cnt[6]);
				int cnt4_3 = Integer.parseInt(cnt[7]);
				int cnt8_3 = Integer.parseInt(cnt[8]);
				roomDto_3.setNum(num);				
				roomDto_3.setRoom_date(date3);
				roomDto_3.setReg_date(new Timestamp(System.currentTimeMillis()));
				roomDto_3.setRoom_2(cnt2_3);
				roomDto_3.setRoom_4(cnt4_3);
				roomDto_3.setRoom_8(cnt8_3);
				roomDto_3.setId("id1");
				roomDto_3.setName(request.getParameter("name"));
				roomDto_3.setTel(request.getParameter("tel"));
				roomDto_3.setCarnum(request.getParameter("carnum"));
				roomDto_3.setRoom_price(Integer.parseInt(request.getParameter("room_price")));
				roomDto_3.setRoom_check(request.getParameter("room_check"));
				result = reserveDao.room_insert(roomDto_3);
			}
		}		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		
		return new ModelAndView( "reverse/reverseRoomPro" );
	}

}
