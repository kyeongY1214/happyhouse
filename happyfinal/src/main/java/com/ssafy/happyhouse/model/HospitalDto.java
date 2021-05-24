package com.ssafy.happyhouse.model;

public class HospitalDto {
	private String sido;
	private String gu;
	private String name;
	private String address;
	private String schedule_week;
	private String schedule_sat;
	private String schedule_sun;
	private String tel;

	public HospitalDto(String sido, String gu, String name, String address, String schedule_week, String schedule_sat,
			String schedule_sun, String tel) {
		super();
		this.sido = sido;
		this.gu = gu;
		this.name = name;
		this.address = address;
		this.schedule_week = schedule_week;
		this.schedule_sat = schedule_sat;
		this.schedule_sun = schedule_sun;
		this.tel = tel;
	}

	public HospitalDto() {
		super();
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSchedule_week() {
		return schedule_week;
	}

	public void setSchedule_week(String schedule_week) {
		this.schedule_week = schedule_week;
	}

	public String getSchedule_sat() {
		return schedule_sat;
	}

	public void setSchedule_sat(String schedule_sat) {
		this.schedule_sat = schedule_sat;
	}

	public String getSchedule_sun() {
		return schedule_sun;
	}

	public void setSchedule_sun(String schedule_sun) {
		this.schedule_sun = schedule_sun;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "HospitalDto [sido=" + sido + ", gu=" + gu + ", name=" + name + ", address=" + address
				+ ", schedule_week=" + schedule_week + ", schedule_sat=" + schedule_sat + ", schedule_sun="
				+ schedule_sun + ", tel=" + tel + "]";
	}

}
