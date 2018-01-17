package reverse;

import java.sql.Timestamp;
import java.util.Date;

public class RoomReverseDataBean {
	private int num;
	private	String id;	
	private Timestamp reg_date;
	private	Date room_date;
	private	int room_2;
	private	int room_4;
	private	int room_8;
	private	String name;
	private	String tel;
	private	String carnum;
	private String room_check;
	private int room_price;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Date getRoom_date() {
		return room_date;
	}
	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}
	public int getRoom_2() {
		return room_2;
	}
	public void setRoom_2(int room_2) {
		this.room_2 = room_2;
	}
	public int getRoom_4() {
		return room_4;
	}
	public void setRoom_4(int room_4) {
		this.room_4 = room_4;
	}
	public int getRoom_8() {
		return room_8;
	}
	public void setRoom_8(int room_8) {
		this.room_8 = room_8;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getRoom_check() {
		return room_check;
	}
	public void setRoom_check(String room_check) {
		this.room_check = room_check;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
		
}
