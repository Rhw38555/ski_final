package reverse;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import db.SqlMapClient;

public class ReverseDBBean implements ReverseDao{

	SqlSession sql = SqlMapClient.getSqlSession();
	
	@Override
	public int ski_insert(SkiReverseDataBean skiDto) {
		return sql.insert("reserve.ski_insert",skiDto);
	}	
	
	@Override
	public List<SkiReverseDataBean> ski_getReserve(int num) {
		return sql.selectList("reserve.ski_getreserve", num);	
	}
	
	@Override
	public int ski_getNum() {
		int cnt = 0;
		int num = 0;
		
		cnt = sql.selectOne("reserve.ski_getcnt");
		if(cnt == 0) {
			num = 1;
		}else {
			num = sql.selectOne("reserve.ski_maxnum");
			num += 1;
		}
		return num;
	}
	
	@Override
	public int ski_delete(int num) {
		return sql.delete("reserve.ski_delete",num);
	}

	@Override
	public int room_insert(RoomReverseDataBean roomDto) {
		return sql.insert("reserve.room_insert",roomDto);
	}

	@Override
	public int room_getNum() {
		int cnt = 0;
		int num = 0;
		
		cnt = sql.selectOne("reserve.room_getcnt");
		if(cnt == 0) {
			num = 1;
		}else {
			num = sql.selectOne("reserve.room_maxnum");
			num += 1;
		}
		return num;
	}
	@Override
	public List<RoomReverseDataBean> room_getReserve(int num) {
		return sql.selectList("reserve.room_getreserve", num);	
	}

	@Override
	public int room_delete(int num) {
		return sql.delete("reserve.room_delete",num);
	}

}
