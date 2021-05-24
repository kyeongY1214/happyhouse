package com.ssafy.happyhouse.model;

public class RetailDto {
	private String name;
	private String kind;
	private String detail;
	private String sido;
	private String gu;
	private String dong;
	private String address;

	// 위도 경도
	private String lat;
	private String lng;
	
	
	
	public RetailDto() {
		super();
	}


	public RetailDto(String name, String kind, String detail, String sido, String gu, String dong, String address,
			String lat, String lng) {
		super();
		this.name = name;
		this.kind = kind;
		this.detail = detail;
		this.sido = sido;
		this.gu = gu;
		this.dong = dong;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getKind() {
		return kind;
	}



	public void setKind(String kind) {
		this.kind = kind;
	}



	public String getDetail() {
		return detail;
	}



	public void setDetail(String detail) {
		this.detail = detail;
	}



	public String getSido() {
		return sido;
	}



	public void setSido(String sido) {
		this.sido = sido;
	}



	public String getGu() {
		return gu;
	}



	public void setGu(String gu) {
		this.gu = gu;
	}



	public String getDong() {
		return dong;
	}



	public void setDong(String dong) {
		this.dong = dong;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
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



	@Override
	public String toString() {
		return "RetailDto [name=" + name + ", kind=" + kind + ", detail=" + detail + ", sido=" + sido + ", gu=" + gu
				+ ", dong=" + dong + ", address=" + address + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
}
