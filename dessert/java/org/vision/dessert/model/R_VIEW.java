package org.vision.dessert.model;
/**
 * 오라클 view 만들기 소스 (제목:RESERVE_VIEW)
 SELECT 
 
REGNO,MEMID,IMG,
dessert_RESERVE.NAME,dessert_RESERVE.PRICE,dessert_RESERVE.INFO,dessert_RESERVE.CATEGORY
	FROM dessert, dessert_RESERVE 
	WHERE dessert.NO = dessert_RESERVE.NO;
 */

public class R_VIEW {
	private int regno;
	private String memid;
	private String img;
	private String name;
	private int price;
	private String info;
	private String category;
	public int getRegno() {
		return regno;
	}
	public void setRegno(int regno) {
		this.regno = regno;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	} 
}