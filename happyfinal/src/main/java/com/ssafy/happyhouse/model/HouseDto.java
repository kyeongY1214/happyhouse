package com.ssafy.happyhouse.model;

//확인!!!
public class HouseDto {
	//추가
	@Override
	public String toString() {
		return "houseDto [no=" + no + ", area=" + area + ", price=" + price + ", code=" + code + ", gugun=" + gugun
				+ ", dong=" + dong + ", aptName=" + aptName + ", lat=" + lat + ", lng=" + lng + "]";
	}
	int no;
	
	//면적 가격
	String area;
	String price;
	 
	//구군코드
	String code;
	String gugun; //시/구/군
	String dong; // 동
	
	String aptName;
	String city;
	
	//위도 경도
	String lat;
	String lng;
	
	String dealDate;
	
	
	
	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public HouseDto() {}

	public int getNo() {
		return no;
	}
	
	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public void setNo(int no) {
		this.no = no;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}

	
	
}
