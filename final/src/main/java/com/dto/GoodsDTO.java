package com.dto;

public class GoodsDTO {
	
	private String gCode;
	private String gCategory;
	private String gName;
	private String gContent;
	private int gPrice;
	private String gImage;
	private String gUCategory;
	
	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsDTO(String gCode, String gCategory, String gName, String gContent, int gPrice, String gImage,
			String gUCategory) {
		super();
		this.gCode = gCode;
		this.gCategory = gCategory;
		this.gName = gName;
		this.gContent = gContent;
		this.gPrice = gPrice;
		this.gImage = gImage;		
		this.gUCategory = gUCategory;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}

	public String getgCategory() {
		return gCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgContent() {
		return gContent;
	}

	public void setgContent(String gContent) {
		this.gContent = gContent;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public String getgImage() {
		return gImage;
	}

	public void setgImage(String gImage) {
		this.gImage = gImage;
		
	}

	public String getgUCategory() {
		return gUCategory;
	}

	public void setgUCategory(String gUCategory) {
		this.gUCategory = gUCategory;
	}

	@Override
	public String toString() {
		return "GoodsDTO [gCode=" + gCode + ", gCategory=" + gCategory + ", gName=" + gName + ", gContent=" + gContent
				+ ", gPrice=" + gPrice + ", gImage=" + gImage + ", gUCategory=" + gUCategory + "]";
	}
	
	
}
