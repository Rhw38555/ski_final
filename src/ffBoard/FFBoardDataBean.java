package ffBoard;

// FF �Խ��� ������ ��
public class FFBoardDataBean {
	private int num; // �۹�ȣ
	private String name; // ��ȣ�� / �ü���
	private String subject; // ������
	private String category; // ���� / �ü� �з� (��/��/��/��/���� �� or �ȳ�/�Ƿ� ��)
	private String introduce; // ���� / �ü��� �Ұ���
	private String location; // ���� / �ü��� ��ġ
	private String thumbnail; // ���� / �ü��� ������ ����
	private String images; // ���� / �ü��� �ڼ��� ������ (�������� ���� ����)
	private String division; // ���� / �ü� ����. 0�� ����, 1�� �ü�
	
	
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
