package com.kh.water.model.vo;

public class Water {
	private int waterNo;
	private String waterBrand;
	private int price;
	
	public Water() {}

	public Water(int waterNo, String waterBrand, int price) {
		super();
		this.waterNo = waterNo;
		this.waterBrand = waterBrand;
		this.price = price;
	}

	public int getWaterNo() {
		return waterNo;
	}

	public void setWaterNo(int waterNo) {
		this.waterNo = waterNo;
	}

	public String getWaterBrand() {
		return waterBrand;
	}

	public void setWaterBrand(String waterBrand) {
		this.waterBrand = waterBrand;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Water [waterNo=" + waterNo + ", waterBrand=" + waterBrand + ", price=" + price + "]";
	}
	
	
	
	
}
