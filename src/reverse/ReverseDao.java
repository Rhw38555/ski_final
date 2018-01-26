package reverse;

import java.util.List;
import java.util.Map;

public interface ReverseDao {
	public List<SkiReverseDataBean> ski_getReserve( int num );
	public int ski_insert(SkiReverseDataBean skiDto);
	public int ski_delete(int num);
	public int ski_getNum();
	
	public List<RoomReverseDataBean> room_getReserve( int num ); 
	public int room_insert(RoomReverseDataBean roomDto);
	public int room_delete(int num);
	public int room_getNum();
	
	public List<RoomReverseDataBean> roomCount( Map<String, String> map );
	
	public List<SkiReverseDataBean> skiCount( Map<String, String> map );
	public int roomCheck(String id);
	public int skiCheck(String id);
}

