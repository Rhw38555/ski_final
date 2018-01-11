package ffBoard;

// FF 게시판 데이터 빈
public class FFBoardDataBean {
	private int num; // 글번호
	private String name; // 상호명 / 시설명
	private String subject; // 글제목
	private String category; // 가게 / 시설 분류 (한/일/양/중/스낵 등 or 안내/의료 등)
	private String introduce; // 가게 / 시설의 소개글
	private String location; // 가게 / 시설의 위치
	private String thumbnail; // 가게 / 시설의 섬네일 사진
	private String images; // 가게 / 시설의 자세한 사진들 (델리미터 구분 예정)
	private String division; // 가게 / 시설 구분. 0은 가게, 1은 시설
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
}
