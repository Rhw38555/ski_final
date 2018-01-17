package reverse;

import java.util.ArrayList;
import java.util.List;

public interface ReverseDao {
	public List<SkiReverseDataBean> ski_getReserve( int num );
	public int ski_insert(SkiReverseDataBean skiDto);
	public int ski_delete(int num);
	public int ski_getNum();
	
	public List<RoomReverseDataBean> room_getReserve( int num ); 
	public int room_insert(RoomReverseDataBean roomDto);
	public int room_delete(int num);
	public int room_getNum();

}

