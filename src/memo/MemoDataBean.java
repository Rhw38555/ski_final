package memo;

import java.sql.Timestamp;

public class MemoDataBean {
	public Timestamp memo_date;
	public String memo;
	public String day_check;
	
	public Timestamp getMemo_date() {
		return memo_date;
	}
	public void setMemo_date(Timestamp memo_date) {
		this.memo_date = memo_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getDay_check() {
		return day_check;
	}
	public void setDay_check(String day_check) {
		this.day_check = day_check;
	}
}
