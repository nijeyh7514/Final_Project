package com.dto;

public class BoardReplyDTO {

	int contentNum;
	String author;
	String content;
	String writeday;
	
	public BoardReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardReplyDTO(int contentNum, String author, String content, String writeday) {
		super();
		this.contentNum = contentNum;
		this.author = author;
		this.content = content;
		this.writeday = writeday;
	}

	public int getContentNum() {
		return contentNum;
	}

	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	@Override
	public String toString() {
		return "BoardReplyDTO [contentNum=" + contentNum + ", author=" + author + ","
				+ "content=" + content + ", writeday=" + writeday + "]";
	}
}
