package eventBoard;

// 이벤트 게시판
public class EventBoardDataBean {
	private int num; // 글번호
	private String subject; // 글제목
	private String thumbnail; // 섬네일 경로
	private String image; // 이벤트 이미지 경로
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
