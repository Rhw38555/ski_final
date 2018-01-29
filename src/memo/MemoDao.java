package memo;

import java.util.List;
import java.util.Map;

public interface MemoDao {
	 public List<MemoDataBean> getMemo( Map<String, String> map );
	 public MemoDataBean getMemoOne( Map<String, String> map );
	 public int insertMemo( Map<String, String> map );
	 public int updateMemo( Map<String, String> map );
	 public int deleteMemo( Map<String, String> map );
}