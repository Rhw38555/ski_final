package reverse;

import java.sql.Timestamp;
import java.util.Date;

public class SkiReverseDataBean {
	private String id;
	private int num;
	private Date ski_date;
	private Timestamp reg_date;
	private int ski_morning;
	private int ski_night;
	private int ski_day;
	private String name;
	private String tel;
	private String carnum;
	private int ski_price;
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getSki_date() {
		return ski_date;
	}
	public void setSki_date(Date ski_date) {
		this.ski_date = ski_date;
	}
	public int getSki_morning() {
		return ski_morning;
	}
	public void setSki_morning(int ski_morning) {
		this.ski_morning = ski_morning;
	}
	public int getSki_night() {
		return ski_night;
	}
	public void setSki_night(int ski_night) {
		this.ski_night = ski_night;
	}
	public int getSki_day() {
		return ski_day;
	}
	public void setSki_day(int ski_day) {
		this.ski_day = ski_day;
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
	public int getSki_price() {
		return ski_price;
	}
	public void setSki_price(int ski_price) {
		this.ski_price = ski_price;
	}
		
}
