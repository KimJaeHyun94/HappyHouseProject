package com.ssafy.happyhouse.model.dto;

public class CCTV {
	private int no;
	private String dong;
	private String purpose;
	private double lat;
	private double lng;

	public CCTV() {
	}

	public CCTV(int no, String dong, String purpose, double lat, double lng) {
		this.no = no;
		this.dong = dong;
		this.purpose = purpose;
		this.lat = lat;
		this.lng = lng;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "CCTV [no=" + no + ", dong=" + dong + ", purpose=" + purpose + ", lat=" + lat + ", lng=" + lng + "]";
	}

}
